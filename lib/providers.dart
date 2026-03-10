import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/common/utils/dependency_injection/dependency_injection.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:sonora/presentation/home/bloc/home_bloc.dart';
import 'package:sonora/presentation/home/bloc/home_event.dart';
import 'package:sonora/presentation/search/bloc/search_bloc.dart';
import 'package:sonora/presentation/search/bloc/search_event.dart';
import 'package:sonora/presentation/settings/bloc/settings_bloc.dart';
import 'package:sonora/presentation/settings/bloc/settings_event.dart';

List<BlocProvider> get appBlocProviders => [
  BlocProvider<DashboardBloc>(
    create: (_) => sl<DashboardBloc>(),
  ),
  BlocProvider<HomeBloc>(
    create: (_) => sl<HomeBloc>()..add(const LoadHomeData()),
  ),
  BlocProvider<SearchBloc>(
    create: (_) => sl<SearchBloc>()..add(const LoadSearchData()),
  ),
  BlocProvider<SettingsBloc>(
    create: (_) => sl<SettingsBloc>()..add(const LoadSettings()),
  ),
];
