import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/global/resources/mock_data.dart';
import 'package:sonora/presentation/search/bloc/search_event.dart';
import 'package:sonora/presentation/search/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<LoadSearchData>(_onLoadSearchData);
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<RemoveRecentSearch>(_onRemoveRecentSearch);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onLoadSearchData(LoadSearchData event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.loading));
    
    await Future<void>.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
      status: SearchStatus.success,
      recentSearches: MockData.recentSearches,
      categories: MockData.categories,
    ));
  }

  void _onSearchQueryChanged(
      SearchQueryChanged event, Emitter<SearchState> emit) {
    if (event.query.isEmpty) {
      emit(state.copyWith(
        query: '',
        searchResultsSongs: [],
        searchResultsArtists: [],
      ));
      return;
    }

    final query = event.query.toLowerCase();

    final filteredSongs = MockData.songs.where((song) {
      final title = song['title']?.toLowerCase() ?? '';
      final artist = song['artist']?.toLowerCase() ?? '';
      return title.contains(query) || artist.contains(query);
    }).toList();

    final filteredArtists = MockData.artists.where((artist) {
      final name = artist['name']?.toLowerCase() ?? '';
      return name.contains(query);
    }).toList();

    emit(state.copyWith(
      query: event.query,
      searchResultsSongs: filteredSongs,
      searchResultsArtists: filteredArtists,
    ));
  }

  void _onRemoveRecentSearch(
      RemoveRecentSearch event, Emitter<SearchState> emit) {
    final updatedList = List<Map<String, String>>.from(state.recentSearches);
    if (event.index >= 0 && event.index < updatedList.length) {
      updatedList.removeAt(event.index);
      emit(state.copyWith(recentSearches: updatedList));
    }
  }

  void _onClearSearch(ClearSearch event, Emitter<SearchState> emit) {
    emit(state.copyWith(query: ''));
  }
}
