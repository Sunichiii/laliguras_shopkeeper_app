import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 2),
              ),
              child: const Icon(
                Icons.person,
                size: 50,
                color: AppColors.background,
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                // Handle Choose Image Action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: AppColors.primary),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                "Choose Image",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
