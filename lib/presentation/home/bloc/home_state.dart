import 'package:equatable/equatable.dart';
import 'package:sonora/domain/entities/song_entities.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeDataLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeDataLoadedState extends HomeState {
  final List<SongEntities> songEntities;
  HomeDataLoadedState({required this.songEntities});
  @override
  List<Object?> get props => [songEntities];
}

class HomeDataErrorState extends HomeState {
  final String message;
  HomeDataErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class HomeSearchState extends HomeState {
  @override
  List<Object?> get props => [];
}
