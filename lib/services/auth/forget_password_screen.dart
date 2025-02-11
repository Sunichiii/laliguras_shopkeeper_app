// import "package:flutter/material.dart";
// import 'package:provider/provider.dart';
// import 'package:laliguras_shopkeeper/widgets/custom%20buttons/long_button.dart';
// import 'package:laliguras_shopkeeper/widgets/custom%20textfields/custom_text_field.dart';
//
// import '../../providers/auth_provider.dart';
//
// class ForgetPasswordScreen extends StatefulWidget {
//   const ForgetPasswordScreen({super.key});
//
//   @override
//   State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
// }
//
// class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
//   final TextEditingController _emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 400), // To prevent stretching on large screens
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min, // Keeps content centered vertically
//                 crossAxisAlignment: CrossAxisAlignment.start, // Centers text inside the column
//                 children: [
//                   Text(
//                     "Reset Your Password",
//                     style: Theme.of(context).textTheme.titleLarge,
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     "Enter your email address and we'll send you a password reset link.",
//                     style: Theme.of(context).textTheme.bodyMedium,
//                   ),
//                   const SizedBox(height: 30),
//                   CustomTextField(
//                     hintText: "Enter your email",
//                     hintStyle: Theme.of(context).textTheme.bodySmall,
//                     imagePath: "assets/icons/email.png",
//                     controller: _emailController, // Pass the controller to collect email
//                   ),
//                   const SizedBox(height: 20),
//                   if (authProvider.message != null)
//                     Text(
//                       authProvider.message!,
//                       style: const TextStyle(color: Colors.green),
//                     ),
//                   if (authProvider.errorMessage != null)
//                     Text(
//                       authProvider.errorMessage!,
//                       style: const TextStyle(color: Colors.red),
//                     ),
//                   const SizedBox(height: 20),
//                   authProvider.isLoading
//                       ? const Center(child: CircularProgressIndicator())
//                       : LongButton(
//                     text: "Send Reset Link",
//                     onPressed: () {
//                       // Trigger the forgot password functionality
//                       final email = _emailController.text.trim();
//                       if (email.isNotEmpty) {
//                         authProvider.sendResetLink(email);
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text("Please enter a valid email address."),
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
