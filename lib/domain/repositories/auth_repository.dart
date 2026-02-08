import 'package:sonora/data/models/user_model.dart';

abstract class AuthRepository {
  Future<void> signUp(UserModel  userModel);
  Future<void> signIn(UserModel  userModel);
}
