import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/features/product/widgets/custom_topping_card.dart';
import 'package:api_app/features/product/widgets/spicy_slider.dart';
import 'package:api_app/shared/custom_pay_widget.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double value = 0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpicySlider(
                value: value,
                onChanged: (v) {
                  value = v;
                  setState(() {});
                },
              ),
              const Gap(30),
              const CustomText(
                text: '    Toppings',
                size: 18,
                color: Color(0xff3C2F2F),
                fontWeight: FontWeight.w600,
              ),
              const Gap(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => const CustomToppingCard(
                      bgButton: Color(0xffEF2A39),
                      path: 'assets/images/test/test1.png',
                      title: 'Tomato',
                    ),
                  ),
                ),
              ),
              const Gap(30),
              const CustomText(
                text: '    Slid options',
                size: 18,
                color: Color(0xff3C2F2F),
                fontWeight: FontWeight.w600,
              ),
              const Gap(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => const CustomToppingCard(
                      bgButton: AppColors.primary,
                      path: 'assets/images/test/test2.png',
                      title: 'Fries',
                    ),
                  ),
                ),
              ),
              const Gap(200),
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(vertical: 5),
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
        child: CustomPayWidget(
          payButtom: () {},
          textPay: '18.19',
          textButtom: 'Add To Cart',
        ),
      ),
    );
  }
}
