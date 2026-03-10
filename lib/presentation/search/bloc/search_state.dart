import 'package:equatable/equatable.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/domain/entities/search_entities.dart';

enum SearchStatus { initial, loading, success, failure }

final class SearchState extends Equatable {
  final SearchStatus status;
  final List<RecentSearchEntity> recentSearches;
  final List<SearchCategoryEntity> categories;
  final List<MediaEntities> searchResultsSongs;
  final List<MediaEntities> searchResultsArtists;
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
    List<RecentSearchEntity>? recentSearches,
    List<SearchCategoryEntity>? categories,
    List<MediaEntities>? searchResultsSongs,
    List<MediaEntities>? searchResultsArtists,
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
