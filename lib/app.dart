import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/global/utils/themes/app_theme.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:sonora/presentation/dashboard/view/dashboard_view.dart';

class Sonora extends StatelessWidget {
  const Sonora({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => DashboardBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const DashboardView(),
      ),
    );
  }
}
