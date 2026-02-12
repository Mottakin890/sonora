import 'package:sonora/data/services/auth_firebase_service.dart';
import 'package:sonora/domain/entities/user_entities.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';
import 'package:sonora/domain/results/failure.dart';
import 'package:sonora/domain/results/result.dart';
import 'package:sonora/domain/results/success.dart';

class AuthFirebaseRepo extends AuthRepository {
  final IAuthFirebaseService _authFirebaseService;

  AuthFirebaseRepo(this._authFirebaseService);

  @override
  Future<Result<UserEntities>> signIn(String email, String password) async {
    try {
      final response = await _authFirebaseService.signIn(email, password);
      if (response.isSuccess && response.data != null) {
        return Success<UserEntities>(data: response.data!);
      }
      return Failure(
        message: response.message ?? 'Sign in failed',
        statusCode: response.statusCode,
      );
    } on Exception catch (e) {
      return Failure(message: e.toString());
    }
  }

  @override
  Future<Result<UserEntities>> signUp(String email, String password) async {
    try {
      final response = await _authFirebaseService.signUp(email, password);
      if (response.isSuccess && response.data != null) {
        return Success<UserEntities>(data: response.data!);
      }
      return Failure(
        message: response.message ?? 'Sign up failed',
        statusCode: response.statusCode,
      );
    } on Exception catch (e) {
      return Failure(message: e.toString());
    }
  }

  @override
  Future<Result<UserEntities>> getUser() async {
    try {
      final response = await _authFirebaseService.getUser();
      if (response.isSuccess && response.data != null) {
        return Success<UserEntities>(data: response.data!);
      }
      return Failure(
        message: response.message ?? "User data fetching  failed.",
      );
    } on Exception catch (e) {
      return Failure(message: e.toString());
    }
  }

  @override
  Future<Result<void>> logOut() async {
    try {
      final response = await _authFirebaseService.logOut();
      if (response.isSuccess) {
        return const Success<void>(data: null);
      }
      return Failure(
        message: response.message ?? 'Log out failed.',
      );
    } on Exception catch (e) {
      return Failure(message: e.toString());
    }
  }
}
