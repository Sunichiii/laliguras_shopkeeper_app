import 'package:flutter/material.dart';
import '../../data/models/login_request.dart';
import '../../data/models/user_model.dart';
import '../../data/models/forgot_password_request.dart';
import '../domain/use_cases/login_usecase.dart';
import '../domain/use_cases/forgot_password_usecase.dart';

class AuthProvider with ChangeNotifier {
  final LoginUseCase loginUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  AuthProvider({required this.loginUseCase, required this.forgotPasswordUseCase});

  UserModel? _user;
  bool _isLoading = false;
  String? _errorMessage;
  String? _message; // For forgot password success message

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get message => _message;

  // Login Functionality
  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await loginUseCase.execute(LoginRequest(email: email, password: password));
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  // Forgot Password Functionality
  Future<void> sendResetLink(String email) async {
    _isLoading = true;
    _errorMessage = null;
    _message = null;
    notifyListeners();

    try {
      _message = await forgotPasswordUseCase.execute(ForgotPasswordRequest(email: email));
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
