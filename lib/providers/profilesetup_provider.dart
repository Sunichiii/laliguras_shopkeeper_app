import 'package:flutter/material.dart';

class ProfileSetupProvider with ChangeNotifier {
  String email = "pujankhanal@gmail.com";
  String fullName = "Pujan Khanal";
  String mobile = "9840252536";

  void saveProfile() {
    // Logic to save profile
    notifyListeners();
  }
}
