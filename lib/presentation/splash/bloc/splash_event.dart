import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable{}

class SplashStarted extends SplashEvent{
  @override
  List<Object?> get props => [];
}
