import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadHomeData extends HomeEvent {
  const LoadHomeData();

  @override
  List<Object?> get props => [];
}

class HomeFilterChanged extends HomeEvent {
  final String filter;

  const HomeFilterChanged(this.filter);

  @override
  List<Object?> get props => [filter];
}
