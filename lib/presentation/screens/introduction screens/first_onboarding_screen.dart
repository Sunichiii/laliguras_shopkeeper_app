import 'package:flutter/material.dart';

class FirstOnboardingScreen extends StatelessWidget {
  const FirstOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(
        height: 140,
      ),
      Image.asset("assets/images/ride.png"),
      const SizedBox(
        height: 20,
      ),
      Text(
        "Freshness Delivered Daily",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        "Get warehouse-fresh vegetables \n to your shop with just a few taps.",
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    ]);
  }
}
