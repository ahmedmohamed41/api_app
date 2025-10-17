import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.desc,
    this.onAdd,
    this.onMin,
    this.onRemove,
    required this.number,
  });
  final String imagePath, title, desc;
  final void Function()? onAdd;
  final void Function()? onMin;
  final void Function()? onRemove;
  final int number;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Column(
              children: [
                Image.asset(imagePath),
                CustomText(
                  text: title,
                  size: 16,
                  color: const Color(0xff3C2F2F),
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: desc,
                  size: 16,
                  color: const Color(0xff3C2F2F),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                      backgroundColor: AppColors.primary,
                      mini: true,
                      onPressed: onMin,
                      child: const Text(
                        '-',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Gap(17),
                    Text(
                      '$number',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Gap(17),
                    FloatingActionButton(
                      backgroundColor: AppColors.primary,
                      mini: true,
                      onPressed: onAdd,
                      child: const Text(
                        '+',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20),
                    ),
                  ),
                  onPressed: onRemove,
                  child: const Text(
                    'Remove',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
