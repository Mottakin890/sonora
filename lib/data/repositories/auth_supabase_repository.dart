import 'package:sonora/common/utils/logger.dart';
import 'package:sonora/data/sources/services/auth_supabase_service.dart';
import 'package:sonora/domain/entities/user_entities.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';
import 'package:sonora/domain/results/failure.dart';
import 'package:sonora/domain/results/result.dart';
import 'package:sonora/domain/results/success.dart';

class AuthSupabaseRepository extends AuthRepository {
  final IAuthSupabaseService _authSupabaseService;

  AuthSupabaseRepository(this._authSupabaseService);

  @override
  Future<Result<UserEntities>> signIn(String email, String password) async {
    try {
      final response = await _authSupabaseService.signIn(email, password);
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
  Future<Result<UserEntities>> signUp(
    String username,
    String email,
    String password,
  ) async {
    try {
      final response = await _authSupabaseService.signUp(
        username,
        email,
        password,
      );
      if (response.isSuccess && response.data != null) {
        Log.i(response);
        return Success<UserEntities>(data: response.data!);
      } else {
        Log.e(response.message);
        return Failure(
          message: response.message ?? 'Sign up failed',
          statusCode: response.statusCode,
        );
      }
    } on Exception catch (e) {
      Log.e(e.toString());
      return Failure(message: e.toString());
    }
  }

  @override
  Future<Result<UserEntities>> getUser() async {
    try {
      final response = await _authSupabaseService.getUser();
      if (response.isSuccess && response.data != null) {
        Log.i(response);
        return Success<UserEntities>(data: response.data!);
      } else {
        Log.e(response.message);

        return Failure(
          message: response.message ?? "User data fetching  failed.",
        );
      }
    } on Exception catch (e) {
      Log.e(e.toString());

      return Failure(message: e.toString());
    }
  }

  @override
  Future<Result<void>> logOut() async {
    try {
      final response = await _authSupabaseService.logOut();
      if (response.isSuccess) {
        return const Success<void>(data: null);
      }
      return Failure(
        message: response.message ?? 'Log out failed.',
      );
    } on Exception catch (e) {
      Log.e(e.toString());

      return Failure(message: e.toString());
    }
  }
}
