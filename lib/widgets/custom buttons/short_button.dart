import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';

class ShortButton extends StatelessWidget {
  const ShortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        "Save",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
