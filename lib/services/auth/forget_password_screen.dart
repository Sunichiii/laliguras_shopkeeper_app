import "package:flutter/material.dart";
import 'package:laliguras_shopkeeper/widgets/custom%20buttons/long_button.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20textfields/custom_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reset Your Password", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 10),
            Text(
              "Enter your email address and we'll send you a password reset link.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hintText: "Enter your email",
              hintStyle: Theme.of(context).textTheme.bodySmall,
              imagePath: "assets/icons/email.png",
            ),
            const SizedBox(height: 20),
            LongButton(
              text: "Send Reset Link",
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
