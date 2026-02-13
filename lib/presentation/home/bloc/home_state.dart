import 'package:equatable/equatable.dart';
import 'package:sonora/domain/entities/user_entities.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  final UserEntities userData;
  HomeInitialState({required this.userData});
  @override
  List<Object?> get props => [userData];
}

class HomeDataLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeDataErrorState extends HomeState {
  final String message;
  HomeDataErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
