import 'dart:io';

import 'package:sonora/common/utils/logger.dart';
import 'package:sonora/data/models/user_model.dart';
import 'package:sonora/data/response/service_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IAuthSupabaseService {
  Future<ServiceResponse<UserModel>> signUp(
    String username,
    String email,
    String password,
  );
  Future<ServiceResponse<UserModel>> signIn(String email, String password);
  Future<ServiceResponse<UserModel>> getUser();
  Future<ServiceResponse<void>> logOut();
}

class AuthSupabaseService implements IAuthSupabaseService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  @override
  Future<ServiceResponse<UserModel>> signIn(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return ServiceResponse.success(
        data: UserModel(
          email: userCredential.user!.email ?? '',
          id: userCredential.user!.id,
          username: userCredential.user?.userMetadata?['username'] as String,
        ),
      );
    } on AuthException catch (e) {
      Log.e(e.toString());

      return ServiceResponse.error(
        message: e.message,
        statusCode: int.tryParse(e.statusCode ?? '') ?? 400,
      );
    } on SocketException catch (e) {
      Log.e(e.toString());

      return ServiceResponse.error(
        message: 'No internet connection',
        statusCode: 503,
      );
    } on Exception catch (e) {
      Log.e(e.toString());

      return ServiceResponse.error(
        message: 'An unexpected error occurred: $e',
        statusCode: 500,
      );
    }
  }

  @override
  Future<ServiceResponse<UserModel>> signUp(
    String username,
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'username': username,
        },
      );
      return ServiceResponse.success(
        data: UserModel(
          email: userCredential.user!.email ?? '',
          id: userCredential.user!.id,
          username: userCredential.user?.userMetadata?['username'] as String,
        ),
      );
    } on AuthException catch (e) {
      Log.e(e.toString());

      return ServiceResponse.error(
        message: e.message,
        statusCode: int.tryParse(e.statusCode ?? '') ?? 400,
      );
    } on SocketException catch (e) {
      Log.e(e.toString());

      return ServiceResponse.error(
        message: 'No internet connection',
        statusCode: 503,
      );
    } on Exception catch (e) {
      Log.e(e.toString());

      return ServiceResponse.error(
        message: 'An unexpected error occurred: $e',
        statusCode: 500,
      );
    }
  }

  @override
  Future<ServiceResponse<UserModel>> getUser() async {
    try {
      final user = _supabaseClient.auth.currentUser;
      if (user != null) {
        return ServiceResponse.success(
          data: UserModel(
            id: user.id,
            username: user.userMetadata?['username'] as String,
            email: user.email ?? '',
          ),
        );
      }
      return ServiceResponse<UserModel>.error(
        statusCode: 401,
        message: 'No user found.',
      );
    } on Exception catch (e) {
      Log.e(e.toString());

      return ServiceResponse<UserModel>.error(
        statusCode: 500,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ServiceResponse<void>> logOut() async {
    try {
      final user = _supabaseClient.auth.currentUser;
      if (user != null) {
        await _supabaseClient.auth.signOut();

        return ServiceResponse<void>.success();
      } else {
        return ServiceResponse.error(
          statusCode: 402,
          message: "User not found",
        );
      }
    } on Exception catch (e) {
      Log.e(e.toString());

      return ServiceResponse<void>.error(
        statusCode: 500,
        message: e.toString(),
      );
    }
  }
}
