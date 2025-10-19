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
    return TextField(
      controller: controller,
      cursorColor: AppColors.white,
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontWeight: FontWeight.bold),
        hoverColor: Colors.white,
        focusColor: AppColors.white,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(
          lable,
          style: const TextStyle(color: AppColors.grey),
        ),
        fillColor: AppColors.primary,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.white),
        ),
      ),
    );
  }
}
