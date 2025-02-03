import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';

class OrderStatusBar extends StatelessWidget {
  final int currentStep;

  const OrderStatusBar({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStep(Icons.access_time, "Confirmed", 0),
        _buildDivider(0),
        _buildStep(Icons.shopping_bag_sharp, "Picking Items", 1),
        _buildDivider(1),
        _buildStep(Icons.delivery_dining, "Out for delivery", 2),
        _buildDivider(2),
        _buildStep(Icons.check_box_outlined, "Delivered", 3),
      ],
    );
  }

  Widget _buildStep(IconData icon, String label, int step) {
    return Column(
      children: [
        Icon(
          icon,
          color: step <= currentStep ? AppColors.primary : Colors.grey,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: step <= currentStep ? AppColors.primary : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(int step) {
    return Expanded(
      child: Divider(
        color: step < currentStep ? AppColors.primary : Colors.grey,
        thickness: 2,
      ),
    );
  }
}
