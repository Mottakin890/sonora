import 'package:get_it/get_it.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:sonora/presentation/home/bloc/home_bloc.dart';
import 'package:sonora/presentation/search/bloc/search_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<DashboardBloc>(DashboardBloc.new);
  sl.registerLazySingleton<HomeBloc>(HomeBloc.new);
  sl.registerLazySingleton<SearchBloc>(SearchBloc.new);
}
