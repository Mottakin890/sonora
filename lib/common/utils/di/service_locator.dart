import 'package:get_it/get_it.dart';
import 'package:sonora/data/implementation/auth_repository_impl.dart';
import 'package:sonora/data/repo/auth_firebase_repo.dart';
import 'package:sonora/data/services/auth_services.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';
import 'package:sonora/domain/usecases/sign_up_usecase.dart';

final serviceLocator = GetIt.instance;

Future<void> dependencyInjection() async {
  serviceLocator.registerSingleton<AuthFirebaseRepo>(AuthServices());
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  serviceLocator.registerSingleton<SignUpUsecase>(SignUpUsecase());
}
