import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/custom buttons/long_button.dart';

import '../../core/themes/colors.dart';
import '../../widgets/custom textfields/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.login(_emailController.text, _passwordController.text);

    if (authProvider.user != null) {
      Navigator.pushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authProvider.errorMessage ?? "Login failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2),
            Text('Login', style: textTheme.titleLarge),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'Email',
              imagePath: 'assets/icons/email.png',
              controller: _emailController, // ✅ Now passing the controller
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Password',
              imagePath: 'assets/icons/password.png',
              controller: _passwordController, // ✅ Now passing the controller
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
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
            const SizedBox(height: 20),
            authProvider.isLoading
                ? const CircularProgressIndicator()
                : LongButton(text: 'Continue', onPressed: _login),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
