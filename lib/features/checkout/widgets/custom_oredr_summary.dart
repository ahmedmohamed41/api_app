import 'package:api_app/features/checkout/widgets/custom_order_summary_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomOrderSummary extends StatelessWidget {
  const CustomOrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            CustomOrderSummaryItem(
              itemName: 'Order',
              price: 16.48,
            ),
            Gap(10),
            CustomOrderSummaryItem(
              itemName: 'Taxes',
              price: 3.0,
            ),
            Gap(10),
            CustomOrderSummaryItem(
              itemName: 'Delivery fees',
              price: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}