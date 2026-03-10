import 'package:equatable/equatable.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

final class LoadSearchData extends SearchEvent {
  const LoadSearchData();
}

final class SearchQueryChanged extends SearchEvent {
  final String query;
  const SearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

final class RemoveRecentSearch extends SearchEvent {
  final int index;
  const RemoveRecentSearch(this.index);

  @override
  List<Object?> get props => [index];
}

final class ClearSearch extends SearchEvent {
  const ClearSearch();
}
