import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/features/auth/widgets/custom_button_profile.dart';
import 'package:api_app/features/auth/widgets/custom_text_filed.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    _nameController.text = 'Khodary Moo';
    _emailController.text = 'Khodary@gmail.com';
    _addressController.text = 'Khodary street ,EGY';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: AppColors.white,
              size: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 129,
                width: 126,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/test/test3.png'),
                  ),
                  color: AppColors.redOf,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 4, color: AppColors.white),
                ),
              ),
            ),
            const Gap(30),
            CustomTextFiled(
              controller: _nameController,
              lable: 'Name',
              hintText: _nameController.text,
            ),
            const Gap(30),
            CustomTextFiled(
              controller: _emailController,
              lable: 'Email',
              hintText: _emailController.text,
            ),
            const Gap(30),
            CustomTextFiled(
              controller: _addressController,
              lable: 'Delivery address',
              hintText: _addressController.text,
            ),
            const Gap(25),
            const Divider(
              color: AppColors.greyOf,
              endIndent: 30,
              indent: 30,
            ),
            const Gap(25),
            ListTile(
              onTap: () {},
              minVerticalPadding: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              tileColor: Colors.blue.shade900,
              leading: Image.asset(
                'assets/images/test/V.D-e36aebe0.png',
                height: 20,
              ),
              title: const CustomText(
                text: 'Debit card',
                color: AppColors.whiteOf,
                fontWeight: FontWeight.w500,
                size: 14,
              ),
              subtitle: const CustomText(
                text: '3566 **** **** 0505',
                color: AppColors.whiteOf,
                fontWeight: FontWeight.w500,
                size: 14,
              ),
              trailing: Radio<String>(
                activeColor: Colors.white,
                value: 'Visa',
                groupValue: 'Visa',
                onChanged: (value) {
                  value = 'Visa';
                },
              ),
            ),
            const Gap(35),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButtonProfile(
                    bgColor: AppColors.white,
                    fgColor: AppColors.primary,
                    icon: Icons.edit_document,
                    title: 'Edit Profile',
                  ),
                  CustomButtonProfile(
                    bgColor: AppColors.primary,
                    fgColor: AppColors.white,
                    icon: Icons.logout,
                    title: 'Log out',
                  ),
                ],
              ),
            ),
            const Gap(5),
          ],
        ),
      ),
    );
  }
}
