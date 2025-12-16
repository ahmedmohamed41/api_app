import 'dart:developer';
import 'dart:io';
import 'package:api_app/core/constant/app_assets.dart';
import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/core/network/api_error.dart';
import 'package:api_app/core/routes_manager/routes.dart';
import 'package:api_app/features/auth/data/auth_repo.dart';
import 'package:api_app/features/auth/data/user_model.dart';
import 'package:api_app/features/auth/widgets/custom_button_profile.dart';
import 'package:api_app/features/auth/widgets/custom_text_filed.dart';
import 'package:api_app/shared/custom_snack.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _visaController = TextEditingController();

  UserModel? userModel;
  AuthRepo authRepo = AuthRepo();
  String? selectedImage;
  bool isLoadingUpdate = false;

  void _safeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    } else {
      log('setState prevented - widget disposed');
    }
  }

  Future<void> _safeAsyncOperation(Future<void> Function() operation) async {
    if (!mounted) return;
    await operation();
  }

  @override
  void initState() {
    super.initState();
    // ✅ 3. تحميل البيانات بأمان
    Future.microtask(() {
      if (mounted) {
        getData();
      }
    });
  }

  @override
  void dispose() {
    log('ProfileView disposed');
    super.dispose();
  }

  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      if (user != null) {
        _safeSetState(() {
          userModel = user;
        });
      }
    } catch (e) {
      log('Error in getProfileData: $e');
    }
  }

  Future<void> updateProfileData() async {
    if (!mounted) return;
    _safeSetState(() => isLoadingUpdate = true);
    try {
      final user = await authRepo.updateProfileData(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        address: _addressController.text.trim(),
        imagePath: selectedImage,
        visa: _visaController.text.trim(),
      );
      if (!mounted) return;
      _safeSetState(() {
        isLoadingUpdate = false;
        userModel = user;
        _nameController.text = user!.name;
        _emailController.text = user.email;
        _addressController.text = user.address == 'null'
            ? 'no address yet'
            : user.address!;
        selectedImage = null;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnack(
            errMessage: 'Profile updated Successfully',
            color: AppColors.primary,
            icon: Icons.check_circle_outline_outlined,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      _safeSetState(() => isLoadingUpdate = false);
      String errorMsg = 'Failed to update profile';
      if (e is ApiError) errorMsg = e.message;
      log('Update profile error: $errorMsg');
    }
  }

  Future<void> logout() async {
    await authRepo.logout();
    Navigator.pushReplacementNamed(
      context,
      Routes.signInRoute,
    );
  }

  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null && mounted) {
      _safeSetState(() {
        selectedImage = pickedImage.path;
      });
    }
  }

  Future<void> getData() async {
    await _safeAsyncOperation(() async {
      await getProfileData();

      if (!mounted) return;

      if (userModel != null) {
        _nameController.text = userModel!.name;
        _emailController.text = userModel!.email;
        _addressController.text = userModel!.address == 'null'
            ? 'no address yet'
            : userModel!.address!;
      }
    });
  }

  String _getSafeVisa(String? visa) {
    if (visa == null || visa.isEmpty || visa == 'null') {
      return '... ... ...';
    }
    return visa;
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: userModel == null,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: AppColors.primary,
                size: 25,
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          backgroundColor: AppColors.primary,
          color: AppColors.white,
          onRefresh: getProfileData, // ✅ 10. استخدام الدالة مباشرة
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  // Profile Image Section
                  userModel == null
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      : Center(
                          child: Container(
                            height: 129,
                            width: 126,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.redOf,
                              border: Border.all(
                                width: 4,
                                color: AppColors.white,
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: selectedImage != null
                                ? Image.file(
                                    File(selectedImage!),
                                    fit: BoxFit.cover,
                                  )
                                : (userModel?.image != null &&
                                      userModel!.image!.isNotEmpty)
                                ? Image.network(
                                    userModel!.image!,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.person, size: 50),
                                  )
                                : const Icon(Icons.person, size: 50),
                          ),
                        ),

                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButtonProfile(
                        radius: 10,
                        height: 40,
                        onTap: pickImage,
                        bgColor: Colors.blueAccent,
                        fgColor: AppColors.white,
                        icon: Icons.camera_alt_outlined,
                        isIcon: true,
                        title: 'upload image',
                      ),
                      CustomButtonProfile(
                        radius: 10,
                        height: 40,
                        onTap: () {
                          _safeSetState(() {
                            selectedImage = null;
                          });
                        },
                        bgColor: AppColors.red,
                        fgColor: AppColors.white,
                        icon: Icons.restore_from_trash,
                        isIcon: true,
                        title: 'remove image',
                      ),
                    ],
                  ),

                  const Gap(20),
                  CustomTextFiled(
                    controller: _nameController,
                    lable: 'Name',
                    hintText: userModel?.name ?? '',
                  ),
                  const Gap(30),
                  CustomTextFiled(
                    controller: _emailController,
                    lable: 'Email',
                    hintText: userModel?.email ?? '',
                  ),
                  const Gap(30),
                  CustomTextFiled(
                    controller: _addressController,
                    lable: 'Address',
                    hintText: userModel?.address == 'null'
                        ? 'no address yet'
                        : userModel?.address ?? '',
                  ),
                  const Gap(15),
                  const Divider(
                    color: AppColors.greyOf,
                    endIndent: 30,
                    indent: 30,
                  ),
                  const Gap(15),
                  ListTile(
                    minVerticalPadding: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    tileColor: Colors.blue.shade900,
                    leading: Image.asset(
                      ImageAssets.vdisae36aebe0Image,
                      height: 20,
                    ),
                    title: const CustomText(
                      text: 'Debit card',
                      color: AppColors.whiteOf,
                      fontWeight: FontWeight.w500,
                      size: 14,
                    ),
                    subtitle: CustomText(
                      text: _getSafeVisa(userModel?.visa),
                      color: AppColors.whiteOf,
                      fontWeight: FontWeight.w500,
                      size: 14,
                    ),
                    trailing: Radio<String>(
                      activeColor: Colors.white,
                      value: 'Visa',
                      groupValue: 'Visa',
                      onChanged: (value) {},
                    ),
                  ),
                  const Gap(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButtonProfile(
                        height: 50,
                        radius: 10,
                        onTap: updateProfileData,
                        bgColor: AppColors.white,
                        fgColor: AppColors.primary,
                        title: isLoadingUpdate ? 'Updating...' : 'Edit Profile',
                      ),
                      CustomButtonProfile(
                        height: 50,
                        radius: 10,
                        onTap: logout,
                        bgColor: AppColors.primary,
                        fgColor: AppColors.white,
                        title: 'Log out',
                      ),
                    ],
                  ),
                  const Gap(50), // ✅ مساحة إضافية للـRefreshIndicator
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
