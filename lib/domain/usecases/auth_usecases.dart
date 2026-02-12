import 'package:sonora/domain/entities/user_entities.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';

import 'package:sonora/domain/results/result.dart';

class AuthUsecases {
  final AuthRepository _authRepository;

  AuthUsecases(this._authRepository);

  Future<Result<UserEntities>> signIn(String email, String password) async {
    return _authRepository.signIn(email, password);
  }

  Future<Result<UserEntities>> signUp(String email, String password) async {
    return _authRepository.signUp(email, password);
  }

  Future<Result<UserEntities>> getUser() async {
    return _authRepository.getUser();
  }

  Future<Result<void>> logOut() {
    return _authRepository.logOut();
  }
}
