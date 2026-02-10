import 'package:dartz/dartz.dart';
import 'package:sonora/data/models/user_model.dart';

abstract class AuthFirebaseRepo {

  Future<Either> signUp(UserModel userModel);
  Future<Either> signIn(UserModel userModel);

}