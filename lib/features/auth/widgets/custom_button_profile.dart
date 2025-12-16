import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/shared/custom_text.dart' show CustomText;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomButtonProfile extends StatelessWidget {
  const CustomButtonProfile({
    super.key,
    required this.bgColor,
    required this.fgColor,
    required this.title,
    this.icon,
    this.onTap,
    this.height,
    this.radius,
    this.isIcon = false,
  });
  final Color bgColor, fgColor;
  final String title;
  final IconData? icon;
  final void Function()? onTap;
  final double? height;
  final double? radius;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 60,
        width: 150,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius ?? 20),
          border: Border.all(color: AppColors.primary, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: title,
              color: fgColor,
              fontWeight: FontWeight.bold,
              size: 16,
            ),
            const Gap(5),
            Visibility(
              visible: isIcon,
              child: Icon(
                icon,
                color: fgColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
