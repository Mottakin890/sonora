import 'package:sonora/common/utils/logger.dart';
import 'package:sonora/data/sources/services/song_service.dart';
import 'package:sonora/domain/entities/song_entities.dart';
import 'package:sonora/domain/repositories/song_repository.dart';
import 'package:sonora/domain/results/result.dart';
import 'package:sonora/domain/results/failure.dart';
import 'package:sonora/domain/results/success.dart';

class SupabaseSongRepository extends SongRepository {
  final ISongService _songService;
  SupabaseSongRepository(this._songService);
  @override
  Future<Result<List<SongEntities>>> getSongs() async {
    try {
      final response = await _songService.getSongs();

      if (response.isSuccess && response.data != null) {
        return Success<List<SongEntities>>(data: response.data!);
      } else {
        Log.e(response.message);
        return Failure(
          message: response.message ?? "Failed to fetch songs",
          statusCode: response.statusCode,
        );
      }
    } on Exception catch (e) {
      Log.e(e);
      return Failure(message: "An unexpected error occurred: $e");
    }
  }
}
