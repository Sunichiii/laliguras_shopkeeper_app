// import 'package:flutter/material.dart';
// import '../../../core/themes/colors.dart';
//
// class QuantitySelector extends StatelessWidget {
//   final int quantity;
//   final VoidCallback onAdd;
//   final VoidCallback onSubtract;
//
//   const QuantitySelector({
//     super.key,
//     required this.quantity,
//     required this.onAdd,
//     required this.onSubtract,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.primary,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//       child: Row(
//         children: [
//           // Subtract Button
//           GestureDetector(
//             onTap: onSubtract,
//             child: const Icon(
//               Icons.remove,
//               color: Colors.white,
//               size: 18,
//             ),
//           ),
//           const SizedBox(width: 8),
//           // Quantity Text
//           Text(
//             quantity.toString(),
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(width: 8),
//           // Add Button
//           GestureDetector(
//             onTap: onAdd,
//             child: const Icon(
//               Icons.add,
//               color: Colors.white,
//               size: 18,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../../../core/themes/colors.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onSubtract;
  final double iconSize;
  final double fontSize;
  final EdgeInsets padding;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onSubtract,
    this.iconSize = 18.0, // Default icon size
    this.fontSize = 16.0, // Default font size
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: padding,
      child: Row(
        children: [
          // Subtract Button
          GestureDetector(
            onTap: onSubtract,
            child: Icon(
              Icons.remove,
              color: Colors.white,
              size: iconSize,
            ),
          ),
          SizedBox(width: iconSize / 2), // Adjust spacing based on icon size
          // Quantity Text
          Text(
            quantity.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: iconSize / 2), // Adjust spacing based on icon size
          // Add Button
          GestureDetector(
            onTap: onAdd,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}

