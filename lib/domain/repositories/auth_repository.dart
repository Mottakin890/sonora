import 'package:sonora/domain/entities/user_entities.dart';
import 'package:sonora/domain/result/result.dart';

abstract class AuthRepository {
  Future<Result<UserEntities>> signUp(String email, String password);
  Future<Result<UserEntities>> signIn(String email, String password);
}
