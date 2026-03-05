import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/global/utils/dependency_injection/dependency_injection.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_bloc.dart';

List<BlocProvider> get appBlocProviders => [
  BlocProvider<DashboardBloc>(
    create: (_) => sl<DashboardBloc>(),
  ),
];
