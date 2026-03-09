import 'package:sonora/domain/repositories/storage_repository.dart';

class ClearCacheUseCase {
  final StorageRepository repository;

  ClearCacheUseCase(this.repository);

  Future<void> call() {
    return repository.clearCache();
  }
}
