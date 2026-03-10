import 'package:get_it/get_it.dart';
import 'package:sonora/data/data_sources/local/storage_local_data_source.dart';
import 'package:sonora/data/repositories/storage_repository_impl.dart';
import 'package:sonora/domain/repositories/storage_repository.dart';
import 'package:sonora/domain/usecases/clear_cache_usecase.dart';
import 'package:sonora/domain/usecases/get_storage_info_usecase.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:sonora/presentation/home/bloc/home_bloc.dart';
import 'package:sonora/presentation/search/bloc/search_bloc.dart';
import 'package:sonora/presentation/settings/bloc/settings_bloc.dart';

final GetIt sl = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    // BLoCs
    sl.registerLazySingleton<DashboardBloc>(DashboardBloc.new);
    sl.registerLazySingleton<HomeBloc>(HomeBloc.new);
    sl.registerLazySingleton<SearchBloc>(SearchBloc.new);
    sl.registerFactory<SettingsBloc>(
      () => SettingsBloc(
        getStorageInfoUseCase: sl(),
        clearCacheUseCase: sl(),
      ),
    );

    // Use Cases
    sl.registerLazySingleton<GetStorageInfoUseCase>(
      () => GetStorageInfoUseCase(sl()),
    );
    sl.registerLazySingleton<ClearCacheUseCase>(() => ClearCacheUseCase(sl()));

    // Data Sources
    sl.registerLazySingleton<StorageLocalDataSource>(
      StorageLocalDataSourceImpl.new,
    );

    // Repositories
    sl.registerLazySingleton<StorageRepository>(
      () => StorageRepositoryImpl(sl()),
    );
  }
}
