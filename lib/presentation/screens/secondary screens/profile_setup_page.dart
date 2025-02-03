import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20bars/bottom_navbar.dart';
import '../../../widgets/custom bars/secondary_appbar.dart';
import '../../../widgets/profile setup widgets/profile_setup_form.dart';

class ProfileSetupPage extends StatelessWidget {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SecondaryAppBar(title: "Profile Setup"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: ProfileSetupForm(), // Modular form widget
      ),
      bottomNavigationBar:BottomNavbar(),
    );
  }
}
