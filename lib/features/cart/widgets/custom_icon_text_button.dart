import 'package:api_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIconTextButton extends StatelessWidget {
  const CustomIconTextButton({
    super.key,
    required this.onMin,
    required this.sign,
  });

  final void Function()? onMin;
  final String sign;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onMin,
        child: Text(
          sign,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
