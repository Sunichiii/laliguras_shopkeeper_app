import 'package:laliguras_shopkeeper/data/models/login_request.dart';
import 'package:laliguras_shopkeeper/data/models/user_model.dart';
import 'package:laliguras_shopkeeper/data/repositories/auth_repository.dart';

class LoginUseCase{
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<UserModel> execute(LoginRequest request){
    return repository.login(request);
  }
}