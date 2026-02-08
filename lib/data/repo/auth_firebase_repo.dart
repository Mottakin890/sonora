import 'package:sonora/data/models/user_model.dart';

abstract class AuthFirebaseRepo {

  Future<void> signUp(UserModel userModel);
  Future<void> signIn(UserModel userModel);

}