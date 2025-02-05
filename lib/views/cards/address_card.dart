import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.location_on_outlined,
            color: AppColors.primary),
        title: const Text("Aaadarsa Tarkari Pasal"),
        subtitle: const Text("Gausala-23, Kathmandu"),
        trailing: IconButton(
          icon: const Icon(Icons.copy, color: Colors.grey),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Address copied!")),
            );
          },
        ),
      ),
    );
  }
}
