import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20bars/secondary_appbar.dart';
import 'package:provider/provider.dart';
import '../../../providers/sales_provider.dart';
import '../../../views/cards/sales_card.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final salesProvider = Provider.of<SalesProvider>(context, listen: false);

    // Call fetchSalesItems when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      salesProvider.fetchSalesItems();
    });

    return Scaffold(
      appBar:
      const SecondaryAppBar(title: "Sales"),

      body: Consumer<SalesProvider>(
        builder: (context, salesProvider, child) {
          if (salesProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (salesProvider.errorMessage != null) {
            return Center(
              child: Text(
                salesProvider.errorMessage!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }

          if (salesProvider.saleItems.isEmpty) {
            return Center(
              child: Text(
                "No items available for sale.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }

          return ListView.builder(
            itemCount: salesProvider.saleItems.length,
            itemBuilder: (context, index) {
              final item = salesProvider.saleItems[index];
              return SalesCard(vegetable: item);
            },
          );
        },
      ),
    );
  }
}


