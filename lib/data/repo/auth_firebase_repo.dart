import 'package:sonora/data/models/user_model.dart';
import 'package:sonora/data/services/auth_firebase_service.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';
import 'package:sonora/domain/result/failure.dart';
import 'package:sonora/domain/result/result.dart';
import 'package:sonora/domain/result/success.dart';

class AuthFirebaseRepo extends AuthRepository {
  final IAuthFirebaseService _authFirebaseService;

  AuthFirebaseRepo(this._authFirebaseService);

  @override
  Future<Result<UserModel>> signIn(String email, String password) async {
    try {
      final response = await _authFirebaseService.signIn(email, password);
      if (response.isSuccess && response.data != null) {
        return Success<UserModel>(data: response.data!);
      }
      return Failure(
        message: response.message ?? 'Sign in failed',
        statusCode: response.statusCode,
      );
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  @override
  Future<Result<UserModel>> signUp(String email, String password) async {
    try {
      final response = await _authFirebaseService.signUp(email, password);
      if (response.isSuccess && response.data != null) {
        return Success<UserModel>(data: response.data!);
      }
      return Failure(
        message: response.message ?? 'Sign up failed',
        statusCode: response.statusCode,
      );
    } catch (e) {
      return Failure(message: e.toString());
    }
  }
}
