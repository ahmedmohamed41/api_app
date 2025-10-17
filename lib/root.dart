import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/features/auth/view/profile_view.dart';
import 'package:api_app/features/cart/views/cart_view.dart';
import 'package:api_app/features/home/views/home_view.dart';
import 'package:api_app/features/orderHistory/views/order_history_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late List<Widget> screens;
  late PageController controller;
  int currentScreen = 0;
  @override
  void initState() {
    screens = const [
      HomeView(),
      CartView(),
      OrderHistoryView(),
      ProfileView(),
    ];
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),

      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentScreen,
          onTap: (value) {
            setState(() {
              currentScreen = value;
              controller.jumpToPage(currentScreen);
            });
          },
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.whiteOf,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(CupertinoIcons.home),
            ),
            const BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(CupertinoIcons.cart),
            ),
            const BottomNavigationBarItem(
              label: 'Order History',
              icon: Icon(Icons.restaurant_menu_outlined),
            ),
            const BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(CupertinoIcons.profile_circled),
            ),
          ],
        ),
      ),
    );
  }
}
