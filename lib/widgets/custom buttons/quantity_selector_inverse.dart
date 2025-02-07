import 'package:flutter/material.dart';

class QuantitySelectorInverse extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onSubtract;

  const QuantitySelectorInverse({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onSubtract,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black), // Black border
        borderRadius: BorderRadius.circular(12), // Smaller radius
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2), // Reduced padding
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onSubtract,
            child: const Icon(
              Icons.remove,
              color: Colors.black, // Black icon
              size: 16, // Smaller size
            ),
          ),
          const SizedBox(width: 8),
          Text(
            quantity.toString(),
            style: const TextStyle(
              color: Colors.black, // Black text
              fontSize: 14, // Smaller font size
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onAdd,
            child: const Icon(
              Icons.add,
              color: Colors.black, // Black icon
              size: 16, // Smaller size
            ),
          ),
        ],
      ),
    );
  }
}
