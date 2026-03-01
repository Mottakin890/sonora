import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {}

class SplashInitState extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashFinishedState extends SplashState{
  @override
  List<Object?> get props => [];
}
