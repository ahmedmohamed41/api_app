import 'package:api_app/features/orderHistory/widgets/custom_card_ord_history.dart';
import 'package:flutter/material.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => CustomCardOrdHistory(
              imagePath: 'assets/images/test/test3.png',
              title: 'Humburgar Humburgar',
              qty: 3,
              price: 20,
              orderAgain: () {},
            ),
            itemCount: 2,
          ),
        ),
      ),
    );
  }
}
