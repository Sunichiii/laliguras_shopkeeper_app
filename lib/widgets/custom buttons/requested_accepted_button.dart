import 'package:flutter/material.dart';

class CustomRequestedAcceptedButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  const CustomRequestedAcceptedButton({
    super.key,
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: isActive ? Colors.pink : Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
