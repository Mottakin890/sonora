import 'package:sonora/domain/entities/song_entities.dart';
import 'package:sonora/domain/repositories/song_repository.dart';
import 'package:sonora/domain/results/result.dart';

class SongUsecases {
  final SongRepository _songRepository;

  const SongUsecases(this._songRepository);

  Future<Result<List<SongEntities>>> getSongs() async {
    return _songRepository.getSongs();
  }
}
