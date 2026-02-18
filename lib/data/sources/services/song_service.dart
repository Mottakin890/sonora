import 'package:sonora/common/utils/logger.dart';
import 'package:sonora/data/models/song_model.dart';
import 'package:sonora/data/response/service_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ISongService {
  Future<ServiceResponse<List<SongModel>>> getSongs();
}

class SongService implements ISongService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  @override
  Future<ServiceResponse<List<SongModel>>> getSongs() async {
    try {
      final response = await _supabaseClient.from('Songs').select();

      final songs = response.map(SongModel.fromJson).toList();

      return ServiceResponse.success(data: songs);
    } on PostgrestException catch (e) {
      Log.e("Error fetching songs: $e");
      return ServiceResponse.error(message: e.toString(), statusCode: 500);
    } on Exception catch (e) {
      Log.e("Error Occured: $e");
      return ServiceResponse.error(message: e.toString(), statusCode: 500);
    }
  }
}
