import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/themes/colors.dart';
import '../../models/vegetable_model.dart';
import '../../providers/bulkorder_provider.dart';
import '../../widgets/custom buttons/add_button.dart';
import '../../widgets/custom buttons/view_more_button.dart';

class BulkOrderCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String discount;
  final List<Vegetable> vegetables;

  const BulkOrderCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.discount,
    required this.vegetables,
  });

  @override
  Widget build(BuildContext context) {
    final bulkOrderProvider = context.read<BulkOrderProvider>();

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Section
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.red,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Free shipping on all your order.\nWe deliver, you enjoy.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Image.asset(
                imagePath,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ViewMoreButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sales');
              },
              text: 'View More',
            ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 1, color: AppColors.grey),
          const SizedBox(height: 8),
          // Vegetable List
          Column(
            children: vegetables.map((vegetable) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Vegetable Name
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Image.asset(
                              vegetable.imagePath,
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                vegetable.name,
                                style: Theme.of(context).textTheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Quantity Controls
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () => bulkOrderProvider
                                .decrementQuantity(vegetable.name),
                            icon: const Icon(Icons.remove, size: 16),
                          ),
                          Text(
                            bulkOrderProvider
                                .getQuantity(vegetable.name)
                                .toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () => bulkOrderProvider
                                .incrementQuantity(vegetable.name),
                            icon: const Icon(Icons.add, size: 16),
                          ),
                        ],
                      ),

                      // Price
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Rs.${vegetable.price}",
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Add Button
                      AddButton(
                        onPressed: () {
                          // Handle add order logic
                        },
                      ),
                    ],
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
