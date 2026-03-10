enum HomeFilterType {
  all,
  music,
  artist,
  playlist;

  String get label {
    switch (this) {
      case HomeFilterType.all:
        return 'All';
      case HomeFilterType.music:
        return 'Music';
      case HomeFilterType.artist:
        return 'Artist';
      case HomeFilterType.playlist:
        return 'Playlist';
    }
  }

  static HomeFilterType fromString(String value) {
    return HomeFilterType.values.firstWhere(
      (e) => e.label.toLowerCase() == value.toLowerCase(),
      orElse: () => HomeFilterType.all,
    );
  }
}
