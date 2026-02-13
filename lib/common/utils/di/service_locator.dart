import 'package:get_it/get_it.dart';
import 'package:sonora/data/repositories/auth_supabase_repository.dart';
import 'package:sonora/data/sources/services/auth_supabase_service.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';
import 'package:sonora/domain/usecases/auth_usecases.dart';
import 'package:sonora/presentation/auth/bloc/auth_bloc.dart';

final GetIt servicelocator = GetIt.instance;

Future<void> dependencyInjection() async {
  // Services
  servicelocator.registerLazySingleton<AuthSupabaseService>(
    AuthSupabaseService.new,
  );

  // Repositories
  servicelocator.registerLazySingleton<AuthRepository>(
    () => AuthSupabaseRepository(servicelocator<AuthSupabaseService>()),
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
