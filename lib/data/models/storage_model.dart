import 'package:sonora/domain/entities/storage_entity.dart';

class StorageModel extends StorageEntity {
  const StorageModel({
    required super.totalSizeGb,
    required super.freeSizeGb,
    required super.usedSizeGb,
    required super.downloadsSizeGb,
    required super.cacheSizeGb,
    required super.otherSizeGb,
  });
}
