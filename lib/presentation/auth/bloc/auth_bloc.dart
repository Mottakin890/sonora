import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/domain/usecases/auth_usecases.dart';
import 'package:sonora/presentation/auth/bloc/auth_event.dart';
import 'package:sonora/presentation/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecases _authUsecases;

  AuthBloc(this._authUsecases) : super(AuthInitialState()) {
    on<SignInEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await _authUsecases.signIn(event.email, event.password);

      result.fold(
        (error) => emit(AuthErrorState(errMsg: error.message)),
        (user) => emit(AuthenticatedState(user: user)),
      );
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await _authUsecases.signUp(
        event.username,
        event.email,
        event.password,
      );

      result.fold(
        (error) => emit(AuthErrorState(errMsg: error.message)),
        (user) => emit(AuthenticatedState(user: user)),
      );
    });

    on<AppStarted>((event, emit) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      final isFirstTime = sharedPreferences.getBool('isFirstTime') ?? true;

      if (isFirstTime) {
        emit(FirstRunState());
      } else {
        await Future<void>.delayed(const Duration(seconds: 2));
        final result = await _authUsecases.getUser();

        result.fold(
          (error) => emit(UnAuthenticatedState()),
          (user) => emit(AuthenticatedState(user: user)),
        );
      }
    });

    on<CompleteIntroEvent>((event, emit) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setBool('isFirstTime', false);
      emit(UnAuthenticatedState());
    });

    on<LogOutEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await _authUsecases.logOut();

      result.fold(
        (error) => emit(AuthErrorState(errMsg: error.message)),
        (_) => emit(UnAuthenticatedState()),
      );
    });
  }
}
