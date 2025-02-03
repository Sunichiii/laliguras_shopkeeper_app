import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/colors.dart';
import '../../../providers/onboarding_provider.dart';
import 'first_onboarding_screen.dart';
import 'second_onboarding_screen.dart';
import 'third_onboarding_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final List<Widget> onboardingPages = [
    const FirstOnboardingScreen(),
    const SecondOnboardingScreen(),
    const ThirdOnboardingScreen(),
  ];

   OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);
    final pageController =
        onboardingProvider.pageController; // Use PageController from provider

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, // Removes the back button
        actions: [
          TextButton(
            onPressed: () => onboardingProvider.skipToEnd(context),
            // Skip to login
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Skip',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    'assets/icons/skip.png',
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              // Assign PageController here
              onPageChanged: onboardingProvider.setCurrentPage,
              // Update dots indicator
              itemCount: onboardingPages.length,
              itemBuilder: (context, index) => onboardingPages[index],
            ),
          ),
          const SizedBox(height: 20),
          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingPages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: onboardingProvider.currentPage == index ? 24 : 8,
                decoration: BoxDecoration(
                  color: onboardingProvider.currentPage == index
                      ? AppColors.primary
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Next or Get Started Button
          ElevatedButton(
            onPressed: () {
              if (onboardingProvider.currentPage ==
                  onboardingPages.length - 1) {
                // Navigate to login on the last page
                onboardingProvider.skipToEnd(context);
              } else {
                // Move to the next page
                onboardingProvider.nextPage();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              onboardingProvider.currentPage == onboardingPages.length - 1
                  ? 'Get Started'
                  : 'Next',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
}
