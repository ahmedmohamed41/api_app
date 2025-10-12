import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/features/auth/widgets/custom_elevated_button.dart';
import 'package:api_app/features/auth/widgets/custom_text_form_field.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

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
                SvgPicture.asset('assets/images/logo.svg'),
                const Gap(10),
                const CustomText(
                  textAlign: TextAlign.center,
                  text: 'Welcome Back, Discover The Fast Food',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  size: 13,
                ),
                const Gap(60),
                CustomTextFormField(
                  controller: emailController,
                  hint: 'Email Address',
                ),
                const Gap(30),
                CustomTextFormField(
                  controller: passController,
                  isPassword: true,
                  hint: 'Password',
                ),
                const Gap(30),
                CustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('login success');
                    }
                  },
                  text: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
