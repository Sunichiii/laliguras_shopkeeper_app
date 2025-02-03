import 'package:flutter/material.dart';
import '../../models/order_model.dart';
import '../../widgets/custom buttons/send_receive_button.dart';
import '../../widgets/order widgets/order_status_bar.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onReceive;

  const OrderCard({
    super.key,
    required this.order,
    required this.onReceive,
  });

  @override
  Widget build(BuildContext context) {
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
                backgroundImage: AssetImage(order.imagePath),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      order.address,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.visibility, color: Colors.grey, size: 20),
                  SizedBox(width: 8),
                  Icon(Icons.call, color: Colors.grey, size: 20),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Status Bar
          OrderStatusBar(currentStep: order.currentStep),
          const SizedBox(height: 16),
          // Reusable Receive Button with dynamic text
          Align(
            alignment: Alignment.centerRight,
            child: CustomSendReceiveButton(
              text: "Receive", // Pass the required text here
              onPressed: onReceive,
            ),
          ),
        ],
      ),
    );
  }
}
