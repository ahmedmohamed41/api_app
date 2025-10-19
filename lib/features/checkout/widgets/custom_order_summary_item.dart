import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/material.dart';

class CustomOrderSummaryItem extends StatelessWidget {
  const CustomOrderSummaryItem({
    super.key,
    required this.itemName,
    required this.price,
    this.color,
  });
  final String itemName;
  final double price;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: itemName,
          color: color ?? AppColors.greyOf,
          fontWeight: FontWeight.w400,
          size: 18,
        ),
        const Spacer(),
        CustomText(
          text: '$price\$',
          color: color ?? AppColors.greyOf,
          fontWeight: FontWeight.w400,
          size: 18,
        ),
      ],
    );
  }
}
