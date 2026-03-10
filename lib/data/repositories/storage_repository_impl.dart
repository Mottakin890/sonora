import 'package:sonora/data/data_sources/local/storage_local_data_source.dart';
import 'package:sonora/domain/entities/storage_entity.dart';
import 'package:sonora/domain/repositories/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  final StorageLocalDataSource _localDataSource;

  StorageRepositoryImpl(this._localDataSource);

  @override
  Future<StorageEntity> getStorageInfo() {
    return _localDataSource.getStorageInfo();
  }

  @override
  Future<void> clearCache() async {
    await _localDataSource.clearCache();
  }
}
