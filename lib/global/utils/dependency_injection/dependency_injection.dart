import 'package:get_it/get_it.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_bloc.dart';

final GetIt sl = GetIt.instance;


Future<void> init() async {
  sl.registerLazySingleton<DashboardBloc>(DashboardBloc.new);
}
