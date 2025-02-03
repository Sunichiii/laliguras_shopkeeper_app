import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackButtonPressed;

  const SecondaryAppBar({
    super.key,
    required this.title,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      leading: IconButton(
        onPressed: onBackButtonPressed ?? () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_new, // iOS-style back arrow
          color: AppColors.black,
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(color: AppColors.grey, height: 1),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(57); // AppBar height + gray line
}
