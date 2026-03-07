import 'package:equatable/equatable.dart';

enum SearchStatus { initial, loading, success, failure }

class SearchState extends Equatable {
  final SearchStatus status;
  final List<Map<String, String>> recentSearches;
  final List<Map<String, String>> categories;
  final String query;

  const SearchState({
    this.status = SearchStatus.initial,
    this.recentSearches = const [],
    this.categories = const [],
    this.query = '',
  });

  SearchState copyWith({
    SearchStatus? status,
    List<Map<String, String>>? recentSearches,
    List<Map<String, String>>? categories,
    String? query,
  }) {
    return SearchState(
      status: status ?? this.status,
      recentSearches: recentSearches ?? this.recentSearches,
      categories: categories ?? this.categories,
      query: query ?? this.query,
    );
  }

  @override
  List<Object?> get props => [status, recentSearches, categories, query];
}
