import 'package:sonora/domain/entities/storage_entity.dart';

abstract class StorageRepository {
  Future<StorageEntity> getStorageInfo();
  Future<void> clearCache();
}
