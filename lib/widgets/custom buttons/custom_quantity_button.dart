import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

class QuantityControl extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onSubtract;

  const QuantityControl({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onSubtract,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.remove, color: AppColors.secondary, size: 18),
            onPressed: onSubtract,
          ),
          const SizedBox(width: 8.0),
          Text(
            quantity.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.add, color: AppColors.secondary, size: 18),
            onPressed: onAdd,
          ),
        ],
      ),
    );
  }
}
