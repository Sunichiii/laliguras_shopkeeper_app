
import '../api/api_service.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../../providers/auth_provider.dart';

final apiService = ApiService();
final authRepository = AuthRepository(apiService);
final loginUseCase = LoginUseCase(authRepository);

AuthProvider provideAuthProvider() => AuthProvider(loginUseCase: loginUseCase);
