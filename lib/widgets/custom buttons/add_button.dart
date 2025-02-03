import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0, // Adjusted for better alignment with table
      height: 28.0, // Smaller height for compact design
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 4.0), // Minimal vertical padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Small rounded edges
          ),
        ),
        onPressed: onPressed,
        child: Text(
          'Add',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white, // White text for better readability
          ),
        ),
      ),
    );
  }
}
