import '../../core/api/api_service.dart';
import '../models/login_request.dart';
import '../models/user_model.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<UserModel> login(LoginRequest request) async {
    final response = await apiService.post('auth/login', request.toJson());
    return UserModel.fromJson(response);
  }
}
