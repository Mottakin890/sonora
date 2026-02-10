import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sonora/data/models/user_model.dart';
import 'package:sonora/data/repo/auth_firebase_repo.dart';
import 'dart:developer' as developer;

class AuthServices extends AuthFirebaseRepo {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either> signIn(UserModel userModel) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );

      return const Right('Register successfull.');
    } on FirebaseAuthException catch (e) {
      developer.log(e.toString());
      String msg = '';
      if (e.code == "weak-password") {
        msg = 'Weak password provided.';
      } else if (e.code == 'email-already-in-use') {
        msg = 'This email already exist.';
      }
      return Left(msg);
    }
  }

  @override
  Future<Either> signUp(UserModel userModel) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      return const Right('Sign In successfull');
    } on FirebaseAuthException catch (e) {
      developer.log(e.toString());
      String msg = '';
      if (e.code == "weak-password") {
        msg = 'Weak password provided.';
      } else if (e.code == 'email-already-in-use') {
        msg = 'This email already exist.';
      }
      return Left(msg);
    }
  }
}
