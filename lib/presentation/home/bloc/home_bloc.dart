import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/domain/entities/playlist_entities.dart';
import 'package:sonora/common/resources/mock_data.dart';
import 'package:sonora/domain/entities/filter_type.dart';
import 'package:sonora/presentation/home/bloc/home_event.dart';
import 'package:sonora/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<PlaylistEntities> _allRecentlyPlayed = [];
  final List<MediaEntities> _allMadeForYou = [];
  final List<MediaEntities> _allJumpBackIn = [];
  final List<MediaEntities> _allRecentlyPlayedSection = [];

  HomeBloc() : super(const HomeState()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<HomeFilterChanged>(_onFilterChanged);
  }

  void _onFilterChanged(HomeFilterChanged event, Emitter<HomeState> emit) {
    if (event.filter == state.selectedFilter) return;

    emit(state.copyWith(
      selectedFilter: event.filter,
      recentlyPlayed: _filterItems(_allRecentlyPlayed, event.filter),
      madeForYou: _filterItems(_allMadeForYou, event.filter),
      jumpBackIn: _filterItems(_allJumpBackIn, event.filter),
      recentlyPlayedSection: _filterItems(_allRecentlyPlayedSection, event.filter),
    ));
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      await Future<dynamic>.delayed(const Duration(seconds: 2));

      _allRecentlyPlayed.clear();
      _allRecentlyPlayed.addAll(MockData.homeRecentlyPlayed);
      _allMadeForYou.clear();
      _allMadeForYou.addAll(MockData.madeForYou);
      _allJumpBackIn.clear();
      _allJumpBackIn.addAll(MockData.jumpBackIn);
      _allRecentlyPlayedSection.clear();
      _allRecentlyPlayedSection.addAll(MockData.recentlyPlayedSection);

      emit(
        state.copyWith(
          status: HomeStatus.success,
          recentlyPlayed: _filterItems(_allRecentlyPlayed, state.selectedFilter),
          madeForYou: _filterItems(_allMadeForYou, state.selectedFilter),
          jumpBackIn: _filterItems(_allJumpBackIn, state.selectedFilter),
          recentlyPlayedSection: _filterItems(_allRecentlyPlayedSection, state.selectedFilter),
        ),
      );
    } on Exception {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  List<T> _filterItems<T>(List<T> source, HomeFilterType filter) {
    if (filter == HomeFilterType.all) return source;

    return source.where((e) {
      if (filter == HomeFilterType.music) return true;

      var subtitle = '';
      var isArtist = false;

      if (e is MediaEntities) {
        subtitle = e.subtitle.toLowerCase();
        isArtist = e.isCircle;
      } else if (e is PlaylistEntities) {
        subtitle = 'playlist';
      }

      switch (filter) {
        case HomeFilterType.artist:
          return isArtist || subtitle.contains('artist');
        case HomeFilterType.playlist:
          return !isArtist && (subtitle.contains('playlist') || e is PlaylistEntities);
        case HomeFilterType.music:
          return true;
        case HomeFilterType.all:
          return true;
      }
    }).toList();
  }
}
