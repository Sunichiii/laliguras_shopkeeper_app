import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

class LongButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const LongButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.background, // Ensures text is visible on primary background
          ),
        ),
      ),
    );
  }
}
