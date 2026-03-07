import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class LoadSearchData extends SearchEvent {
  const LoadSearchData();
}

class SearchQueryChanged extends SearchEvent {
  final String query;
  const SearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class RemoveRecentSearch extends SearchEvent {
  final int index;
  const RemoveRecentSearch(this.index);

  @override
  List<Object?> get props => [index];
}

class ClearSearch extends SearchEvent {
  const ClearSearch();
}
