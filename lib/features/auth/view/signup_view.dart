import 'dart:developer';
import 'package:api_app/core/constant/app_assets.dart';
import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/core/network/api_error.dart';
import 'package:api_app/core/routes_manager/routes.dart';
import 'package:api_app/features/auth/data/auth_repo.dart';
import 'package:api_app/features/auth/widgets/custom_elevated_button.dart';
import 'package:api_app/features/auth/widgets/custom_text_form_field.dart';
import 'package:api_app/root.dart';
import 'package:api_app/shared/custom_snack.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _LoginViewState();
}

class _LoginViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  AuthRepo authRepo = AuthRepo();
  bool isLoading = false;
  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        final user = await authRepo.signup(
          _nameController.text.trim(),
          _emailController.text.trim(),
          _passController.text.trim(),
        );
        if (user != null) {
          Navigator.pushReplacementNamed(context, Routes.rootRoute);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(
            customSnack(
              errMessage: 'REGISTERED SUCCESSFUL',
              color: AppColors.primary,
              icon: Icons.check_circle_outline_outlined,
            ),
          );
        }
        setState(() => isLoading = false);
      } catch (e) {
        setState(() => isLoading = false);
        String errMessage = 'Unhandled register error';
        if (e is ApiError) {
          errMessage = e.message;
          log(errMessage);
        }
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          customSnack(
            errMessage: errMessage,
            color: AppColors.red,
            icon: Icons.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(100),
                Column(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.splashLogo,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const Gap(10),
                    const CustomText(
                      textAlign: TextAlign.center,
                      text: 'Welcome to our Food App',
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      size: 13,
                    ),
                  ],
                ),
                const Gap(70),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 40,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                          controller: _nameController,
                          hint: 'Name',
                        ),
                        const Gap(10),
                        CustomTextFormField(
                          controller: _emailController,
                          hint: 'Email Address',
                        ),
                        const Gap(10),
                        CustomTextFormField(
                          controller: _passController,
                          isPassword: true,
                          hint: 'Password',
                        ),
                        const Gap(15),
                        isLoading == true
                            ? const CupertinoActivityIndicator(
                                color: AppColors.primary,
                              )
                            : CustomElevatedButton(
                                fgColor: AppColors.white,
                                bgColor: AppColors.primary,
                                onPressed: _signup,
                                text: 'Signup',
                              ),
                        const Gap(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomElevatedButton(
                              fgColor: AppColors.primary,
                              bgColor: AppColors.white,
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.signInRoute,
                                );
                              },
                              text: 'signIn',
                            ),
                            CustomElevatedButton(
                              fgColor: AppColors.primary,
                              bgColor: AppColors.white,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Root(),
                                  ),
                                );
                              },
                              text: 'Guest',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(120),
                const CustomText(
                  text: '@HungryApp2025',
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                const Gap(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
