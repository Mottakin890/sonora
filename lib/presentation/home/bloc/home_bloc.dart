import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/domain/entities/playlist_entities.dart';
import 'package:sonora/common/resources/mock_data.dart';
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
    
    List<T> filterItems<T>(List<T> source) {
      if (filterLower == 'all') return source;
      return source.where((e) {
        if (filterLower == 'music') return true;
        
        var title = '';
        var subtitle = '';
        var isArtist = false;

        if (e is MediaEntities) {
          title = e.title.toLowerCase();
          subtitle = e.subtitle.toLowerCase();
          isArtist = e.isCircle;
        } else if (e is PlaylistEntities) {
          title = e.title.toLowerCase();
          subtitle = 'playlist';
        }

        if (filterLower == 'artist') {
          return isArtist || subtitle.contains('artist');
        }
        if (filterLower == 'playlist') {
          return !isArtist && (subtitle.contains('playlist') || e is PlaylistEntities);
        }
        
        return title.contains(filterLower) || subtitle.contains(filterLower);
      }).toList();
    }

    emit(state.copyWith(
      selectedFilter: event.filter,
      recentlyPlayed: filterItems(_allRecentlyPlayed),
      madeForYou: filterItems(_allMadeForYou),
      jumpBackIn: filterItems(_allJumpBackIn),
      recentlyPlayedSection: filterItems(_allRecentlyPlayedSection),
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
      
      List<T> filterItems<T>(List<T> source) {
        if (filterLower == 'all') return source;
        return source.where((e) {
          if (filterLower == 'music') return true;
          
          var title = '';
          var subtitle = '';
          var isArtist = false;

          if (e is MediaEntities) {
            title = e.title.toLowerCase();
            subtitle = e.subtitle.toLowerCase();
            isArtist = e.isCircle;
          } else if (e is PlaylistEntities) {
            title = e.title.toLowerCase();
            subtitle = 'playlist';
          }

          if (filterLower == 'artist') {
            return isArtist || subtitle.contains('artist');
          }
          if (filterLower == 'playlist') {
            return !isArtist && (subtitle.contains('playlist') || e is PlaylistEntities);
          }
          
          return title.contains(filterLower) || subtitle.contains(filterLower);
        }).toList();
      }

      emit(
        state.copyWith(
          status: HomeStatus.success,
          recentlyPlayed: filterItems(_allRecentlyPlayed),
          madeForYou: filterItems(_allMadeForYou),
          jumpBackIn: filterItems(_allJumpBackIn),
          recentlyPlayedSection: filterItems(_allRecentlyPlayedSection),
        ),
      );
    } on Exception {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
