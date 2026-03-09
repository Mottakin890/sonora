import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/domain/entities/playlist_entities.dart';
import 'package:sonora/global/resources/mock_data.dart';
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

    final filterLower = event.filter.toLowerCase();
    
    List<MediaEntities> filterMedia(List<MediaEntities> source) {
      if (filterLower == 'all') return source;
      return source.where((e) {
        final sub = e.subtitle.toLowerCase();
        if (filterLower == 'music') {
          return true;
        }
        return sub.contains(filterLower) || e.title.toLowerCase().contains(filterLower);
      }).toList();
    }

    emit(state.copyWith(
      selectedFilter: event.filter,
      madeForYou: filterMedia(_allMadeForYou),
      jumpBackIn: filterMedia(_allJumpBackIn),
      recentlyPlayedSection: filterMedia(_allRecentlyPlayedSection),
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

      // Call the filter logic to properly set the initially filtered items based on current selected filter (usually 'All')
      final filterLower = state.selectedFilter.toLowerCase();
      List<MediaEntities> filterMedia(List<MediaEntities> source) {
        if (filterLower == 'all') return source;
        return source.where((e) {
          if (filterLower == 'music') return true;
          return e.subtitle.toLowerCase().contains(filterLower) || e.title.toLowerCase().contains(filterLower);
        }).toList();
      }

      emit(
        state.copyWith(
          status: HomeStatus.success,
          recentlyPlayed: _allRecentlyPlayed,
          madeForYou: filterMedia(_allMadeForYou),
          jumpBackIn: filterMedia(_allJumpBackIn),
          recentlyPlayedSection: filterMedia(_allRecentlyPlayedSection),
        ),
      );
    } on Exception {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
