import 'package:equatable/equatable.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/domain/entities/playlist_entities.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<PlaylistEntities> recentlyPlayed;
  final List<MediaEntities> madeForYou;
  final List<MediaEntities> jumpBackIn;
  final List<MediaEntities> recentlyPlayedSection;
  final String selectedFilter;

  const HomeState({
    this.status = HomeStatus.initial,
    this.recentlyPlayed = const [],
    this.madeForYou = const [],
    this.jumpBackIn = const [],
    this.recentlyPlayedSection = const [],
    this.selectedFilter = 'All',
  });

  HomeState copyWith({
    HomeStatus? status,
    List<PlaylistEntities>? recentlyPlayed,
    List<MediaEntities>? madeForYou,
    List<MediaEntities>? jumpBackIn,
    List<MediaEntities>? recentlyPlayedSection,
    String? selectedFilter,
  }) {
    return HomeState(
      status: status ?? this.status,
      recentlyPlayed: recentlyPlayed ?? this.recentlyPlayed,
      madeForYou: madeForYou ?? this.madeForYou,
      jumpBackIn: jumpBackIn ?? this.jumpBackIn,
      recentlyPlayedSection:
          recentlyPlayedSection ?? this.recentlyPlayedSection,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }

  @override
  List<Object?> get props => [
    status,
    recentlyPlayed,
    madeForYou,
    jumpBackIn,
    recentlyPlayedSection,
    selectedFilter,
  ];
}
