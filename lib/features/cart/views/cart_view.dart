import 'package:api_app/features/cart/widgets/custom_card_widget.dart';
import 'package:api_app/shared/custom_pay_widget.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int number = 20;
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
                    imagePath: 'assets/images/test/test3.png',
                    title: 'Humburgar',
                    desc: 'Veggie Burger',
                    onRemove: () {},
                    onAdd: () => onAdd(index),
                    onMin: () => onMin(index),
                  ),
                  itemCount: quintites.length,
                ),
              ),
              const CustomPayWidget(
                textPay: '99.99',
                textButtom: 'Checkout',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
