import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';

class AddToCartButtonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double verticalPadding;
  final double horizontalPadding;
  final double borderRadius;

  const AddToCartButtonButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.background,
    this.verticalPadding = 6.0, // Reduced vertical padding
    this.horizontalPadding = 12.0, // Reduced horizontal padding
    this.borderRadius = 18.0, // Adjusted border radius for smaller size
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        minimumSize: const Size(80, 32), // Adjusted minimum size
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 14, // Reduced font size
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
