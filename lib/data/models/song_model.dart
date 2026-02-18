import 'package:sonora/domain/entities/song_entities.dart';

class SongModel extends SongEntities {
  SongModel({
    required super.id,
    required super.title,
    required super.artist,
    required super.duration,
  });
  
  factory SongModel.fromJson(Map<String, dynamic> jsonSongModel) {
    return SongModel(
      id: jsonSongModel['id'] as int,
      title: jsonSongModel['title'] as String,
      artist: jsonSongModel['artist'] as String,
      duration: jsonSongModel['duration'] as double,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'artist': artist,
    'duration': duration,
  };
}
