import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20bars/bottom_navbar.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20bars/secondary_appbar.dart';
import 'package:provider/provider.dart';
import '../../../providers/order_provider.dart';
import '../../../views/cards/order_card.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<OrderProvider>().orders;

    return Scaffold(
      appBar: const SecondaryAppBar(title: "Order"),
      bottomNavigationBar: const BottomNavbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(
              "Today's Order",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16), // Space between title and cards
            // List of Order Cards
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return OrderCard(
                    order: order,
                    onReceive: () {
                      context
                          .read<OrderProvider>()
                          .updateOrderStep(index, 2);
                      Navigator.pushNamed(context, '/delivery');// Delivered
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
