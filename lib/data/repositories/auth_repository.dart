import 'package:laliguras_shopkeeper/core/api/api_service.dart';
import 'package:laliguras_shopkeeper/data/models/login_request.dart';
import 'package:laliguras_shopkeeper/data/models/user_model.dart';

import '../models/forgot_password_request.dart';

class AuthRepository{
  final ApiService apiService;

  AuthRepository(this.apiService);
//login ko lagi matra ho yo part
  Future<UserModel> login(LoginRequest request) async{
    final response = await apiService.post('auth/login', request.toJson());
    return UserModel.fromJson(response['data']);
  }
//forget password ko lagi matra ho
  Future<String> forgotPassword(ForgotPasswordRequest request) async {
    final response = await apiService.post('auth/forgot-password', request.toJson());
    return response['message'] ?? 'Reset link sent successfully!';
  }
}