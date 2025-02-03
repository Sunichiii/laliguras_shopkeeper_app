import 'package:flutter/material.dart';

class SecondOnboardingScreen extends StatelessWidget {
  const SecondOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 140,
        ),
        Image.asset("assets/images/watching.png"),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Search Real-Time Tracking",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Stay updated with real-time tracking \n of your vegetable deliveries.",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
