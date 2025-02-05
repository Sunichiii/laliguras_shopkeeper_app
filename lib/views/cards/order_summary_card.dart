import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/themes/colors.dart';
import '../../providers/cart_provider.dart';
class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Rs. ${cartProvider.totalPrice.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Rs. 0",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: AppColors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Total",
                    style: Theme.of(context).textTheme.titleMedium

                ),
                Text(
                    "Rs. ${cartProvider.totalPrice.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.titleMedium
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
