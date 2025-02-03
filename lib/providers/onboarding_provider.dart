import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  final PageController _pageController = PageController(); // Add PageController

  int _currentPage = 0;

  int get currentPage => _currentPage;
  PageController get pageController => _pageController; // Expose PageController

  void setCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void skipToEnd(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void nextPage() {
    // Move to the next page using the PageController
    if (_currentPage < 2) { // Check if not on the last page
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
