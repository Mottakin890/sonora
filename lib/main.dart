import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/themes/app_theme.dart';
import 'package:sonora/common/utils/di/service_locator.dart';
import 'package:sonora/common/utils/enums.dart';

import 'package:sonora/data/sources/endpoints/supabase_endpoints.dart';
import 'package:sonora/presentation/auth/bloc/auth_bloc.dart';
import 'package:sonora/presentation/auth/bloc/auth_event.dart';
import 'package:sonora/presentation/auth/bloc/auth_state.dart';
import 'package:sonora/common/utils/logger.dart';

import 'package:sonora/presentation/auth/view/register_or_sign_in.dart';
import 'package:sonora/presentation/home/view/home_view.dart';
import 'package:sonora/presentation/intro/view/get_started_screen.dart';
import 'package:sonora/presentation/splash/view/splash_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;

void main(List<String> args) async {
  await _initApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SonoraApp(),
    ),
  );
}

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _deployment(Deployment.production);
  await Supabase.initialize(
    url: SupabaseEndpoints.baseUrl,
    anonKey: SupabaseEndpoints.apiKey,
  );
  await dependencyInjection();
}

Future<void> _deployment(Deployment deployment) async {
  await dotenv.load(fileName: '.env');
  try {
    SupabaseEndpoints.baseUrl = (deployment == Deployment.production)
        ? dotenv.env['PROJECT_URL']!
        : dotenv.env['STAGING_PROJECT_URL']!;
    SupabaseEndpoints.apiKey = (deployment == Deployment.production)
        ? dotenv.env['ANON_KEY']!
        : dotenv.env['STAGING_ANON_KEY']!;
  } on Exception catch (e) {
    Log.e("Deployment error: $e");
  }
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
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthenticatedState) {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }
          },
          builder: (context, state) {
            Log.d('state: $state');
            if (state is AuthenticatedState) {
              return HomeView(user: state.user);
            } else if (state is UnAuthenticatedState ||
                state is AuthErrorState) {
              return const RegisterOrSignIn();
            } else if (state is FirstRunState) {
              return const GetStartedScreen();
            } else {
              return const SplashView();
            }
          },
        ),
      ),
    );
  }
}
