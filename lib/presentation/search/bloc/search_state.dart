import 'package:equatable/equatable.dart';

enum SearchStatus { initial, loading, success, failure }

final class SearchState extends Equatable {
  final SearchStatus status;
  final List<Map<String, String>> recentSearches;
  final List<Map<String, String>> categories;
  final List<Map<String, String>> searchResultsSongs;
  final List<Map<String, String>> searchResultsArtists;
  final String query;

  const SearchState({
    this.status = SearchStatus.initial,
    this.recentSearches = const [],
    this.categories = const [],
    this.searchResultsSongs = const [],
    this.searchResultsArtists = const [],
    this.query = '',
  });

  SearchState copyWith({
    SearchStatus? status,
    List<Map<String, String>>? recentSearches,
    List<Map<String, String>>? categories,
    List<Map<String, String>>? searchResultsSongs,
    List<Map<String, String>>? searchResultsArtists,
    String? query,
  }) {
    return SearchState(
      status: status ?? this.status,
      recentSearches: recentSearches ?? this.recentSearches,
      categories: categories ?? this.categories,
      searchResultsSongs: searchResultsSongs ?? this.searchResultsSongs,
      searchResultsArtists: searchResultsArtists ?? this.searchResultsArtists,
      query: query ?? this.query,
    );
  }

  @override
  List<Object?> get props => [
        status,
        recentSearches,
        categories,
        searchResultsSongs,
        searchResultsArtists,
        query,
      ];
}
