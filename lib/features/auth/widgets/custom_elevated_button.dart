import 'package:api_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.bgColor,
    required this.fgColor,
    this.radius,
  });
  final String text;
  final double? radius;
  final void Function()? onPressed;
  final Color? bgColor, fgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(radius ?? 7),
          side: const BorderSide(color: AppColors.white, width: 2),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            color: fgColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
