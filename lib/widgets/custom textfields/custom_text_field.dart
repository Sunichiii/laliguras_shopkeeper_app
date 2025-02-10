import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String imagePath;
  final bool obscureText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.imagePath,
    this.obscureText = false,
    this.hintStyle,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset(
                imagePath,
                width: 30,
                height: 30,
                color: AppColors.primary,
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
                  border: InputBorder.none,
                ),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        const SizedBox(height: 1),
        const Divider(
          thickness: 1,
          color: AppColors.grey,
        ),
      ],
    );
  }
}
