import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/features/auth/widgets/custom_elevated_button.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomPayWidget extends StatelessWidget {
  const CustomPayWidget({
    super.key,
    required this.textPay,
    required this.textButtom,
    this.payButtom,
  });
  final String textPay, textButtom;
  final void Function()? payButtom;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Total',
                  size: 15,
                  color: Color(0xff3C2F2F),
                  fontWeight: FontWeight.w600,
                ),
                const Gap(10),
                CustomText(
                  text:
                      r'$'
                      '$textPay',
                  size: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            const Spacer(),
            CustomElevatedButton(
              fgColor: AppColors.white,
              bgColor: AppColors.primary,
              onPressed: payButtom,
              text: textButtom,
            ),
          ],
        ),
      ),
    );
  }
}
