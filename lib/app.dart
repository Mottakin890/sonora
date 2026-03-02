import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/global/utils/pages/page_views_exports.dart';
import 'package:sonora/global/utils/themes/app_themes.dart';
import 'package:sonora/presentation/home/view/home_view.dart';
import 'package:sonora/presentation/splash/bloc/splash_bloc.dart';
import 'package:sonora/presentation/splash/bloc/splash_event.dart';
import 'package:sonora/presentation/splash/bloc/splash_state.dart';

class Sonora extends StatelessWidget {
  const Sonora({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()..add(SplashStarted())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            if (state is SplashFinishedState) {
              return const HomeView();
            }
            return const SplashView();
          },
        ),
      ),
    );
  }
}
