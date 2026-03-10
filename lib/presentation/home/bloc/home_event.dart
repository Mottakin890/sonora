import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class LoadHomeData extends HomeEvent {
  const LoadHomeData();

  @override
  List<Object?> get props => [];
}

final class HomeFilterChanged extends HomeEvent {
  final String filter;

  const HomeFilterChanged(this.filter);

  @override
  List<Object?> get props => [filter];
}
