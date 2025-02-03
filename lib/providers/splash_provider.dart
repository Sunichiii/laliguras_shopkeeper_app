import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier {
    Future<void> initializeApp(BuildContext context) async {
        await Future.delayed(const Duration(seconds:2));
        final bool hasCompletedOnboarding = false;

        if (hasCompletedOnboarding) {
            Navigator.pushReplacementNamed(context, '/home');
        } else {
            Navigator.pushReplacementNamed(context, '/onboarding');
        }
    }
}
