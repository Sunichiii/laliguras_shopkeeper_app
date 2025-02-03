import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashProvider>(context, listen: false)
          .initializeApp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/icons/logo.png"), // Splash logo
      ),
    );
  }
}
