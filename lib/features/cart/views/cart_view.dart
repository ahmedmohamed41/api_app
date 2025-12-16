import 'package:api_app/core/constant/app_assets.dart';
import 'package:api_app/features/cart/widgets/custom_card_widget.dart';
import 'package:api_app/features/checkout/views/checkout_views.dart';
import 'package:api_app/shared/custom_pay_widget.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int number = 10;
  List<int> quintites = [];
  @override
  void initState() {
    quintites = List.generate(
      number,
      (index) => 1,
    );
    super.initState();
  }

  void onAdd(index) {
    setState(() {
      quintites[index]++;
    });
  }

  void onMin(index) {
    setState(() {
      if (quintites[index] > 1) {
        quintites[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => CustomCardWidget(
                    number: quintites[index],
                    imagePath: ImageAssets.test3Image,
                    title: 'Humburgar',
                    desc: 'Veggie Burger',
                    onRemove: () {},
                    onAdd: () => onAdd(index),
                    onMin: () => onMin(index),
                  ),
                  itemCount: quintites.length,
                ),
              ),
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        height: 85,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              blurStyle: BlurStyle.solid,
            ),
          ],
        ),

        child: CustomPayWidget(
          payButtom: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return const CheckoutViews();
                },
              ),
            );
          },
          textPay: '99.99',
          textButtom: 'Checkout',
        ),
      ),
    );
  }
}
