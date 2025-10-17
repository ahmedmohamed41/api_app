import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/features/product/views/product_details_view.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.pathImage,
    required this.title,
    required this.subTitle,
    required this.rate,
  });
  final String pathImage, title, subTitle, rate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetailsView(),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(pathImage),
              CustomText(
                text: title,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                size: 13,
              ),
              CustomText(
                text: subTitle,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                size: 13,
              ),
              const Gap(5),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                    size: 20,
                  ),
                  const Gap(5),
                  CustomText(
                    text: rate,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    size: 13,
                  ),
                  const Spacer(),
                  const Icon(
                    CupertinoIcons.heart_fill,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
