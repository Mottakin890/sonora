import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sonora/data/models/user_model.dart';
import 'package:sonora/data/response/service_response.dart';

abstract class IAuthFirebaseService {
  Future<ServiceResponse<UserModel>> signUp(String email, String password);
  Future<ServiceResponse<UserModel>> signIn(String email, String password);
  Future<ServiceResponse<UserModel>> getUser();
}

class AuthFirebaseService implements IAuthFirebaseService {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<ServiceResponse<UserModel>> signIn(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ServiceResponse.success(
        data: UserModel(
          email: userCredential.user!.email ?? '',
          id: userCredential.user!.uid,
          username: userCredential.user!.displayName ?? "",
        ),
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return ServiceResponse.error(
            message: 'No user found with this email',
            statusCode: 404,
          );
        case 'wrong-password':
          return ServiceResponse.error(
            message: 'Incorrect password',
            statusCode: 401,
          );
        case 'invalid-email':
          return ServiceResponse.error(
            message: 'Invalid email format',
            statusCode: 400,
          );
        case 'user-disabled':
          return ServiceResponse.error(
            message: 'This account has been disabled',
            statusCode: 403,
          );
        default:
          return ServiceResponse.error(
            message: e.message ?? 'Authentication failed',
            statusCode: 500,
          );
      }
    } on SocketException {
      return ServiceResponse.error(
        message: 'No internet connection',
        statusCode: 503,
      );
    } catch (e) {
      return ServiceResponse.error(
        message: 'An unexpected error occurred: ${e.toString()}',
        statusCode: 500,
      );
    }
  }

  @override
  Future<ServiceResponse<UserModel>> signUp(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ServiceResponse.success(
        data: UserModel(
          email: userCredential.user!.email ?? '',
          id: userCredential.user!.uid,
          username: userCredential.user!.displayName ?? "",
        ),
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return ServiceResponse.error(
            message: 'An account already exists with this email',
            statusCode: 409,
          );
        case 'invalid-email':
          return ServiceResponse.error(
            message: 'Invalid email format',
            statusCode: 400,
          );
        case 'weak-password':
          return ServiceResponse.error(
            message: 'Password is too weak. Please use a stronger password',
            statusCode: 400,
          );
        default:
          return ServiceResponse.error(
            message: e.message ?? 'Sign up failed',
            statusCode: 500,
          );
      }
    } on SocketException {
      return ServiceResponse.error(
        message: 'No internet connection',
        statusCode: 503,
      );
    } catch (e) {
      return ServiceResponse.error(
        message: 'An unexpected error occurred: ${e.toString()}',
        statusCode: 500,
      );
    }
  }

  @override
  Future<ServiceResponse<UserModel>> getUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        return ServiceResponse.success(
          data: UserModel(
            id: user.uid,
            username: user.displayName ?? '',
            email: user.email ?? "",
          ),
        );
      }
      return ServiceResponse.error(statusCode: 401, message: "No user found.");
    } catch (e) {
      return ServiceResponse.error(statusCode: 500, message: e.toString());
    }
  }
}
