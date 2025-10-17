import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/features/auth/widgets/custom_elevated_button.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomCardOrdHistory extends StatelessWidget {
  const CustomCardOrdHistory({
    super.key,
    required this.imagePath,
    required this.title,
    required this.qty,
    required this.price,
    this.orderAgain,
  });
  final String imagePath, title;
  final int qty;
  final double price;
  final void Function()? orderAgain;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Image.asset(imagePath),
                const Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: title,
                      size: 14,
                      color: const Color(0xff3C2F2F),
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: 'Qty : X$qty',
                      size: 14,
                      color: const Color(0xff3C2F2F),
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: 'Price : $price\$',
                      size: 14,
                      color: const Color(0xff3C2F2F),
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
            const Gap(15),
            CustomElevatedButton(
              bgColor: Colors.grey.shade400,
              fgColor: AppColors.white,
              onPressed: orderAgain,
              text: 'Order Again',
            ),
          ],
        ),
      ),
    );
  }
}
