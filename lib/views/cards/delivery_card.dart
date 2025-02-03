import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20buttons/send_receive_button.dart';
import '../../core/themes/colors.dart';
import '../../models/delivery_model.dart';

class DeliveryCard extends StatelessWidget {
  final Delivery delivery;
  final VoidCallback onSendRequest;

  const DeliveryCard({
    super.key,
    required this.delivery,
    required this.onSendRequest,
  });

  @override
  Widget build(BuildContext context) {
    // List of all statuses
    final statuses = [
      {"label": "Confirmed", "icon": Icons.check_circle},
      {"label": "Picking Items", "icon": Icons.shopping_basket},
      {"label": "Out for delivery", "icon": Icons.delivery_dining},
      {"label": "Delivered", "icon": Icons.inventory_2},
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(delivery.imagePath),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      delivery.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      delivery.address,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.visibility, color: Colors.grey, size: 20),
            ],
          ),
          const SizedBox(height: 16),
          // Status Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: statuses.map((status) {
              final index = statuses.indexOf(status);
              return Column(
                children: [
                  Icon(
                    status['icon'] as IconData,
                    color: delivery.currentStep >= index
                        ? AppColors.primary
                        : Colors.grey,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status['label'] as String,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: delivery.currentStep >= index
                              ? AppColors.primary
                              : Colors.grey,
                        ),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          // Send Request Button
          Align(
            alignment: Alignment.centerRight,
            child: CustomSendReceiveButton(text: "Send Request", onPressed: onSendRequest)
          ),
        ],
      ),
    );
  }
}
