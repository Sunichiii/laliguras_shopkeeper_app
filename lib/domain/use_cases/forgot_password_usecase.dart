import '../../data/models/forgot_password_request.dart';
import '../../data/repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  Future<String> execute(ForgotPasswordRequest request) {
    return repository.forgotPassword(request);
  }
}

