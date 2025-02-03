import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';

class CustomSendReceiveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomSendReceiveButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Less circular
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ), // Adjust padding for a cleaner look
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: AppColors.background),
      ),
    );
  }
}
