import 'package:get_it/get_it.dart';
import 'package:sonora/data/repositories/auth_firebase_repository.dart';
import 'package:sonora/data/services/auth_firebase_service.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';
import 'package:sonora/domain/usecases/auth_usecases.dart';
import 'package:sonora/presentation/auth/bloc/auth_bloc.dart';

final GetIt servicelocator = GetIt.instance;

Future<void> dependencyInjection() async {
  // Services
  servicelocator.registerLazySingleton<AuthFirebaseService>(
    AuthFirebaseService.new,
  );

  // Repositories
  servicelocator.registerLazySingleton<AuthRepository>(
    () => AuthFirebaseRepo(servicelocator<AuthFirebaseService>()),
  );

  // Use Cases
  servicelocator.registerLazySingleton<AuthUsecases>(
    () => AuthUsecases(servicelocator<AuthRepository>()),
  );

  // BLoCs
  servicelocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(servicelocator<AuthUsecases>()),
  );
}
