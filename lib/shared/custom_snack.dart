import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

SnackBar customSnack({
  required String errMessage,
  required Color color,
  required IconData icon,
}) {
  return SnackBar(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        Icon(
          icon,
          color: AppColors.white,
        ),
        const Gap(10),
        Expanded(
          child: CustomText(
            text: errMessage,
            color: AppColors.white,
            size: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
  );
}
