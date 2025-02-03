import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';

class DetailField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;

  const DetailField({
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
