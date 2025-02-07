import 'package:flutter/material.dart';
import '../../widgets/custom buttons/long_button.dart';
import '../../widgets/custom textfields/custom_text_field.dart';
import '../../core/themes/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2),
            Text(
              'Login',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'Email',
              imagePath: 'assets/icons/email.png',
              hintStyle: textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Password',
              imagePath: 'assets/icons/password.png',
              hintStyle: textTheme.bodySmall,
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Add forgot password logic
                },
                child: TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/forgetPassword');
                  },
                  child: Text(
                    'Forgot Password?',
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            LongButton(
              text: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
