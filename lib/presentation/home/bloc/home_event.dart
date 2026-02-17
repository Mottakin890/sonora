import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class HomeDataInitEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeSearchEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
}
