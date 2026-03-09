import 'package:sonora/domain/entities/storage_entity.dart';
import 'package:sonora/domain/repositories/storage_repository.dart';

class GetStorageInfoUseCase {
  final StorageRepository repository;

  GetStorageInfoUseCase(this.repository);

  Future<StorageEntity> call() {
    return repository.getStorageInfo();
  }
}
