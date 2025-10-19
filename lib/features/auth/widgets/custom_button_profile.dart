import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/shared/custom_text.dart' show CustomText;
import 'package:flutter/material.dart';

class CustomButtonProfile extends StatelessWidget {
  const CustomButtonProfile({
    super.key,
    required this.bgColor,
    required this.fgColor,
    required this.title,
    required this.icon,
  });
  final Color bgColor, fgColor;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        width: 150,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.white, width: 3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
              text: title,
              color: fgColor,
              fontWeight: FontWeight.bold,
              size: 16,
            ),
            Icon(
              icon,
              color: fgColor,
            ),
          ],
        ),
      ),
    );
  }
}
