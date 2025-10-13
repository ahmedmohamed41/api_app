import 'package:api_app/shared/custom_text.dart';
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
