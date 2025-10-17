import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({
    super.key,
    required this.value,
    this.onChanged,
  });
  final double value;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/test/sandwaish_details.png',
          width: 150,
        ),
        const Spacer(),
        Column(
          children: [
            const CustomText(
              text:
                  'Customize Your Burger\nto Your Tastes. Ultimate\nExperience',
              size: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            const Gap(10),
            Slider(
              min: 0,
              max: 1,
              inactiveColor: Colors.grey.shade300,
              activeColor: AppColors.primary,
              value: value,
              onChanged: onChanged,
            ),
            const Row(
              children: [
                Text('🥶'),
                Gap(120),
                Text('🌶️'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
