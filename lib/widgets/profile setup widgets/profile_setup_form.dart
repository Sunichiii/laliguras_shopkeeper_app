import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/widgets/profile%20setup%20widgets/profile_image_section.dart';
import 'package:provider/provider.dart';
import '../../core/themes/colors.dart';
import '../../providers/profilesetup_provider.dart';
import 'details_field.dart';

class ProfileSetupForm extends StatelessWidget {
  const ProfileSetupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileSetupProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Image Section
        const ProfileImageSection(),

        const SizedBox(height: 20),
        // Details Section
        const Text(
          "Details",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        // Detail Fields
        DetailField(
          icon: Icons.email_outlined,
          hintText: provider.email,
        ),
        DetailField(
          icon: Icons.person_outline,
          hintText: provider.fullName,
        ),
        DetailField(
          icon: Icons.phone_outlined,
          hintText: provider.mobile,
        ),
        const DetailField(
          icon: Icons.lock_outline,
          hintText: "Previous Password",
          isPassword: true,
        ),
        const DetailField(
          icon: Icons.lock_outline,
          hintText: "New Password",
          isPassword: true,
        ),
        const DetailField(
            icon: CupertinoIcons.house_fill, hintText: "Shop Name"),

        const SizedBox(height: 20),

        // Save Button
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: provider.saveProfile,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Save",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
