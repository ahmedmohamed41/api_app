import 'package:api_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.controller,
    required this.lable,
    required this.hintText,
  });
  final TextEditingController controller;
  final String lable, hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        cursorColor: AppColors.primary,
        style: const TextStyle(color: AppColors.primary),
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontWeight: FontWeight.bold),
          // hoverColor: Colors.white,
          focusColor: AppColors.white,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(
            lable,
            style: const TextStyle(color: AppColors.primary),
          ),
          fillColor: AppColors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
