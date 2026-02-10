import 'package:dartz/dartz.dart';
import 'package:sonora/common/utils/di/service_locator.dart';
import 'package:sonora/data/models/user_model.dart';
import 'package:sonora/data/repo/auth_firebase_repo.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(UserModel userModel) async {
    return await serviceLocator<AuthFirebaseRepo>().signIn(userModel);
  }

  @override
  Future<Either> signUp(UserModel userModel) async {
    return await serviceLocator<AuthFirebaseRepo>().signUp(userModel);
  }
}
