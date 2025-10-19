import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/features/auth/widgets/custom_elevated_button.dart';
import 'package:api_app/features/checkout/widgets/custom_order_summary_item.dart';
import 'package:api_app/features/checkout/widgets/custom_oredr_summary.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutViews extends StatefulWidget {
  const CheckoutViews({super.key});

  @override
  State<CheckoutViews> createState() => _CheckoutViewsState();
}

class _CheckoutViewsState extends State<CheckoutViews> {
  bool isCheck = false;
  String selectedMethod = 'Cash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Order summary',
              color: AppColors.redOf,
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Gap(10),
            const CustomOrderSummary(),
            const Gap(15),
            const CustomOrderSummaryItem(
              color: Colors.black,
              itemName: 'Total',
              price: 18.19,
            ),
            const Gap(20),
            const Row(
              children: [
                CustomText(
                  text: 'Estimated delivery time:',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  size: 14,
                ),
                Spacer(),
                CustomText(
                  text: '15 - 30 mins',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  size: 14,
                ),
              ],
            ),
            const Gap(50),
            const CustomText(
              text: 'Payment methods',
              color: AppColors.redOf,
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Gap(10),
            ListTile(
              onTap: () => setState(() => selectedMethod = 'Cash'),
              minVerticalPadding: 25,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              tileColor: AppColors.redOf,
              leading: Image.asset(
                'assets/images/test/dollar Background.png',
                height: 60,
              ),
              title: const CustomText(
                text: 'Cash on Delivery',
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                size: 18,
              ),
              trailing: Radio<String>(
                activeColor: Colors.white,
                value: 'Cash',
                groupValue: selectedMethod,
                onChanged: (value) => setState(() => selectedMethod = value!),
              ),
            ),
            const Gap(15),
            ListTile(
              onTap: () => setState(() => selectedMethod = 'Visa'),
              minVerticalPadding: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              tileColor: Colors.blue.shade900,
              leading: Image.asset(
                'assets/images/test/V.D-e36aebe0.png',
                height: 20,
              ),
              title: const CustomText(
                text: 'Debit card',
                color: AppColors.whiteOf,
                fontWeight: FontWeight.w500,
                size: 14,
              ),
              subtitle: const CustomText(
                text: '3566 **** **** 0505',
                color: AppColors.whiteOf,
                fontWeight: FontWeight.w500,
                size: 14,
              ),
              trailing: Radio<String>(
                activeColor: Colors.white,
                value: 'Visa',
                groupValue: selectedMethod,
                onChanged: (value) => setState(() => selectedMethod = value!),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isCheck = !isCheck;
                    });
                  },
                  icon: isCheck
                      ? const Icon(
                          Icons.check_box,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank,
                        ),
                ),
                const Gap(3),
                const CustomText(
                  text: 'Save card details for future payments',
                  color: AppColors.greyOf,
                  fontWeight: FontWeight.w400,
                  size: 13,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            const BoxShadow(
              blurRadius: 5,
              blurStyle: BlurStyle.solid,
            ),
          ],
        ),
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Total',
                    size: 15,
                    color: Color(0xff3C2F2F),
                    fontWeight: FontWeight.w600,
                  ),
                  Gap(10),
                  CustomText(
                    text:
                        r'$'
                        '18.19',
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
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 170,
                      ),
                      child: PopScope(
                        canPop: false,
                        child: Dialog(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: AppColors.primary,
                                  child: Icon(
                                    Icons.check,
                                    color: AppColors.white,
                                    size: 40,
                                  ),
                                ),
                                const Gap(20),
                                const CustomText(
                                  text: 'Success !',
                                  size: 30,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                const Gap(20),
                                const CustomText(
                                  textAlign: TextAlign.center,
                                  text:
                                      'Your payment was successful.\nA receipt for this purchase has \nbeen sent to your email.',
                                  size: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                                const Gap(30),
                                CustomElevatedButton(
                                  fgColor: AppColors.white,
                                  bgColor: AppColors.primary,
                                  onPressed: () => Navigator.pop(context),
                                  text: 'Go Back',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                text: 'pay Now',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
