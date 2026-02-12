import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/themes/app_theme.dart';
import 'package:sonora/common/utils/di/service_locator.dart';
import 'package:sonora/firebase_options.dart';
import 'package:sonora/presentation/auth/bloc/auth_bloc.dart';
import 'package:sonora/presentation/auth/bloc/auth_event.dart';
import 'package:sonora/presentation/auth/bloc/auth_state.dart';
import 'dart:developer' as developer;

import 'package:sonora/presentation/auth/view/sign_in_screen.dart';
import 'package:sonora/presentation/home/view/home_page.dart';
import 'package:sonora/presentation/splash/view/splash_screen.dart';

void main(List<String> args) async {
  await _initApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      const ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: SonoraApp(),
      ),
    );
  });
}

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dependencyInjection();
}

class SonoraApp extends StatelessWidget {
  const SonoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => servicelocator<AuthBloc>()..add(AppStarted()),
        ),
      ],

      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            developer.log(state.toString());
            if (state is AuthenticatedState) {
              return const HomePage();
            } else if (state is UnAuthenticatedState ||
                state is AuthErrorState) {
              return const SignInScreen();
            } else {
              return const SplashScreen();
            }
          },
        ),
      ),
    );
  }
}
