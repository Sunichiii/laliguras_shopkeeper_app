import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20bars/bottom_navbar.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20bars/secondary_appbar.dart';
import 'package:provider/provider.dart';
import '../../../models/vegetable_model.dart';
import '../../../providers/bulkorder_provider.dart';
import '../../../views/cards/bulkorder_card.dart';

class BulkOrderPage extends StatelessWidget {
  const BulkOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vegetables = [
      Vegetable(name: 'Potato', price: 5000, imagePath: 'assets/vegetables/potato.png', rating: 4, category: "Vegetable", id: 1, stock: 38, description: ''),
      Vegetable(name: 'Cabbage', price: 5000, imagePath: 'assets/vegetables/cabbage.png', rating: 4, category: "Vegetable", id: 2, stock: 46, description: ''),
      Vegetable(name: 'Tomato', price: 5000, imagePath: 'assets/vegetables/tomato.png', rating: 4, category: "Vegetable", id: 3, stock: 56, description: ''),
    ];

    final bulkOrderProvider = context.read<BulkOrderProvider>();
    bulkOrderProvider.initializeQuantities(vegetables.map((e) => e.name).toList());

    return Scaffold(
      appBar: const SecondaryAppBar(title: "Bulk Order"),
      bottomNavigationBar: const BottomNavbar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          BulkOrderCard(
            title: "Sale up to 30% OFF",
            imagePath: 'assets/images/offer1.png',
            discount: "30%",
            vegetables: vegetables,
          ),
          BulkOrderCard(
            title: "Sale up to 50% OFF",
            imagePath: 'assets/images/offer2.png',
            discount: "50%",
            vegetables: vegetables,
          ),
        ],
      ),
    );
  }
}
