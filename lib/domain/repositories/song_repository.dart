import 'package:sonora/domain/entities/song_entities.dart';
import 'package:sonora/domain/results/result.dart';

abstract class SongRepository {
  Future<Result<List<SongEntities>>> getSongs();
}
