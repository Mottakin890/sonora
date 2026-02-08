import 'package:sonora/common/utils/di/service_locator.dart';
import 'package:sonora/data/models/user_model.dart';
import 'package:sonora/data/repo/auth_firebase_repo.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signIn(UserModel userModel) {
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(UserModel userModel) async {
    await serviceLocator<AuthFirebaseRepo>().signUp(userModel);
  }
}
