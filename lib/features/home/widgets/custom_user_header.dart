import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomUserHeader extends StatelessWidget {
  const CustomUserHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/images/logo/logo.svg',
              // ignore: deprecated_member_use
              color: AppColors.primary,
              height: 35,
            ),
            const Gap(10),
            const CustomText(
              textAlign: TextAlign.center,
              text: 'Hello, Ahmed Khodary',
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              size: 18,
            ),
          ],
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primary,
          child: Icon(
            CupertinoIcons.person,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
