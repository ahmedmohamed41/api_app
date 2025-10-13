import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/features/home/widgets/custom_material_search.dart';
import 'package:api_app/shared/card_item.dart';
import 'package:api_app/shared/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> listItem = [
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
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Gap(70),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/logo/logo.svg',
                              color: AppColors.primary,
                              height: 35,
                            ),
                            const Gap(10),
                            const CustomText(
                              textAlign: TextAlign.center,
                              text: 'Hello, Rich Sonic',
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              size: 18,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const CircleAvatar(
                          radius: 30,
                        ),
                      ],
                    ),
                    const Gap(10),
                    const CustomMaterialSearch(),
                    const Gap(25),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Row(
                        children: List.generate(
                          listItem.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                color: currentIndex == index
                                    ? AppColors.primary
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                listItem[index],
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
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 15),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 6,
                  (context, index) => const CardItem(
                    pathImage: 'assets/images/test/test.png',
                    title: 'Cheeseburger',
                    subTitle: "Wendy's Burger",
                    rate: '4.9',
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
