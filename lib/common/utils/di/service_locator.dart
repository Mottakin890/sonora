import 'package:get_it/get_it.dart';
import 'package:sonora/data/repositories/auth_supabase_repository.dart';
import 'package:sonora/data/repositories/supabase_song_repository.dart';
import 'package:sonora/data/sources/services/auth_supabase_service.dart';
import 'package:sonora/data/sources/services/song_service.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';
import 'package:sonora/domain/repositories/song_repository.dart';
import 'package:sonora/domain/usecases/auth_usecases.dart';
import 'package:sonora/domain/usecases/song_usecases.dart';
import 'package:sonora/presentation/auth/bloc/auth_bloc.dart';
import 'package:sonora/presentation/home/bloc/home_bloc.dart';

final GetIt servicelocator = GetIt.instance;

Future<void> dependencyInjection() async {
  // Services
  servicelocator.registerLazySingleton<AuthSupabaseService>(
    AuthSupabaseService.new,
  );
  servicelocator.registerSingleton(SongService());

  // Repositories
  servicelocator.registerLazySingleton<AuthRepository>(
    () => AuthSupabaseRepository(servicelocator<AuthSupabaseService>()),
  );
  servicelocator.registerLazySingleton<SongRepository>(
    () => SupabaseSongRepository(servicelocator<SongService>()),
  );

  // Use Cases
  servicelocator.registerLazySingleton<AuthUsecases>(
    () => AuthUsecases(servicelocator<AuthRepository>()),
  );
  servicelocator.registerSingleton(
    SongUsecases(servicelocator<SongRepository>()),
  );

  // BLoCs
  servicelocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(servicelocator<AuthUsecases>()),
  );
  servicelocator.registerLazySingleton<HomeBloc>(
    () => HomeBloc(servicelocator<SongUsecases>()),
  );
}
