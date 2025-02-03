import 'package:flutter/material.dart';

class EntryTextfield extends StatelessWidget {
  final String hintText;
  final String imagePath;
  final TextStyle? hintStyle;
  final bool obscureText;

  const EntryTextfield({
    super.key,
    required this.hintText,
    required this.imagePath,
    this.hintStyle,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          hintText: hintText,
          hintStyle: hintStyle,
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              imagePath,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}
