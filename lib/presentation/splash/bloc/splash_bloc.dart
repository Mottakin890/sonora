import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/presentation/splash/bloc/splash_event.dart';
import 'package:sonora/presentation/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitState()) {
    on<SplashStarted>((event, emit) async {
      await Future<dynamic>.delayed(const Duration(seconds: 3));
      emit(SplashFinishedState());
    });
  }
}
