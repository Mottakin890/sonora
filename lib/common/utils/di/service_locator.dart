import 'package:get_it/get_it.dart';
import 'package:sonora/data/repo/auth_firebase_repo.dart';
import 'package:sonora/data/services/auth_firebase_service.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';
import 'package:sonora/domain/usecases/auth_usecases.dart';

final servicelocator = GetIt.instance;

Future<void> dependencyInjection() async {
  // Services
  servicelocator.registerLazySingleton<AuthFirebaseService>(
    () => AuthFirebaseService(),
  );

  // Repositories
  servicelocator.registerLazySingleton<AuthRepository>(
    () => AuthFirebaseRepo(servicelocator<AuthFirebaseService>()),
  );

  // Use Cases
  servicelocator.registerLazySingleton<AuthUsecases>(
    () => AuthUsecases(servicelocator<AuthRepository>()),
  );
}
