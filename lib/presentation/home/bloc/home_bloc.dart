import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/domain/entities/song_entities.dart';
import 'package:sonora/domain/usecases/song_usecases.dart';

import 'package:sonora/presentation/home/bloc/home_event.dart';
import 'package:sonora/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SongUsecases _songUsecases;

  HomeBloc(this._songUsecases) : super(HomeInitialState()) {
    on<HomeDataInitEvent>((event, emit) async {
      emit(HomeDataLoadingState());
      final result = await _songUsecases.getSongs();

      result.fold(
        (error) => emit(HomeDataErrorState(message: error.message)),
        (songs) => emit(HomeDataLoadedState(songEntities: songs)),
      );
    });
    on<HomeSearchEvent>((event, emit) {
      // Logics for searching
    });
  }
}
