import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomPayVisa extends StatelessWidget {
  const CustomPayVisa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/test/visa_image.png'),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: 'Debit card',
                color: AppColors.redOf,
                fontWeight: FontWeight.w500,
                size: 14,
              ),
              Gap(5),
              CustomText(
                text: '3566 **** **** 0505',
                color: AppColors.greyOf,
                fontWeight: FontWeight.w500,
                size: 14,
              ),
            ],
          ),
          const Icon(
            Icons.radio_button_unchecked,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
