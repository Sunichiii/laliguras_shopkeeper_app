import 'package:flutter/material.dart';

class ThirdOnboardingScreen extends StatelessWidget {
  const ThirdOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 140,
        ),
        Image.asset("assets/images/time_management.png"),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Know Before You Meet",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Text(
          "Order bulk vegetables effortlessly \n and focus on growing your business.",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
