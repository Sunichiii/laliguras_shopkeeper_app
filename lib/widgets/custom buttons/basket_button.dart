import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

class BasketButton extends StatelessWidget {
  const BasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/basket');
      },
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.shopping_cart_outlined),
    );
  }
}
