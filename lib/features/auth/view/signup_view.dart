import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/features/auth/widgets/custom_elevated_button.dart';
import 'package:api_app/features/auth/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _LoginViewState();
}

class _LoginViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController conPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(100),
                SvgPicture.asset('assets/images/logo/logo.svg'),
                const Gap(60),
                CustomTextFormField(
                  controller: nameController,
                  hint: 'Name',
                ),
                const Gap(10),
                CustomTextFormField(
                  controller: emailController,
                  hint: 'Email Address',
                ),
                const Gap(10),
                CustomTextFormField(
                  controller: passController,
                  isPassword: true,
                  hint: 'Password',
                ),
                const Gap(10),
                CustomTextFormField(
                  controller: conPassController,
                  isPassword: true,
                  hint: 'Confirm Password',
                ),
                const Gap(30),
                CustomElevatedButton(
                  fgColor: AppColors.primary,
                  bgColor: AppColors.white,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Sign Up success');
                    }
                  },
                  text: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
