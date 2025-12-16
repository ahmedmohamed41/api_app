import 'package:api_app/core/constant/app_assets.dart';
import 'package:api_app/features/home/widgets/custom_material_search.dart';
import 'package:api_app/features/home/widgets/card_item.dart';
import 'package:api_app/features/home/widgets/custom_user_header.dart';
import 'package:api_app/features/home/widgets/food_category.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> category = [
    'All',
    'Combos',
    'Slider',
    'Classic',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: false,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 160,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(top: 45, right: 20, left: 20),
                child: Column(
                  children: [
                    CustomUserHeader(),
                    Gap(10),
                    CustomSearchFiled(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FoodCategory(
                category: category,
                currentIndex: currentIndex,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 6,
                  (context, index) => const CardItem(
                    pathImage: ImageAssets.testImage,
                    title: 'Cheeseburger',
                    subTitle: "Wendy's Burger",
                    rate: '4.9',
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
