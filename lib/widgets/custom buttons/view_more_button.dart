import 'package:flutter/material.dart';

class ViewMoreButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewMoreButton({
    super.key,
    required this.onPressed, required String text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary, // Green background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Fully rounded edges
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Compact padding
        elevation: 0, // Flat appearance
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min, // Adjust button size to fit content
        children: [
          Text(
            "View More",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white, // White text
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8.0), // Spacing between text and icon
          const Icon(
            Icons.arrow_forward_ios, // Arrow icon
            color: Colors.white,
            size: 16.0, // Icon size
          ),
        ],
      ),
    );
  }
}
