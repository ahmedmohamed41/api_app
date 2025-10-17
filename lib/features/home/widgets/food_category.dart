import 'package:api_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class FoodCategory extends StatefulWidget {
  const FoodCategory({
    super.key,
    required this.category,
    required this.currentIndex,
  });
  final List<String> category;
  final int currentIndex;

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
          children: List.generate(
            widget.category.length,
            (index) => GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? AppColors.primary
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  widget.category[index],
                  style: TextStyle(
                    color: currentIndex == index
                        ? AppColors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
