import 'package:api_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          const Gap(250),
          SvgPicture.asset('assets/images/logo/logo.svg'),
          const Spacer(),
          Image.asset('assets/images/splash/splash.png'),
        ],
      ),
    );
  }
}
