import 'package:firebase_auth/firebase_auth.dart';
import 'package:sonora/data/models/user_model.dart';
import 'package:sonora/data/repo/auth_firebase_repo.dart';
import 'dart:developer' as developer;

class AuthServices extends AuthFirebaseRepo {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signIn(UserModel userModel) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
    } on FirebaseAuthException catch (e) {
      developer.log(e.toString());
    }
  }

  @override
  Future<void> signUp(UserModel userModel) {
    throw UnimplementedError();
  }
}
