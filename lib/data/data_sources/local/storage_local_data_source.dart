import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:storage_space/storage_space.dart';
import 'package:sonora/data/models/storage_model.dart';

abstract class StorageLocalDataSource {
  Future<StorageModel> getStorageInfo();
  Future<void> clearCache();
}

class StorageLocalDataSourceImpl implements StorageLocalDataSource {
  @override
  Future<StorageModel> getStorageInfo() async {
    final space = await getStorageSpace(
      lowOnSpaceThreshold: 2 * 1024 * 1024 * 1024, // 2 GB
      fractionDigits: 2,
    );

    double parse(String s) {
      final clean = s.replaceAll(RegExp('[^0-9.]'), '');
      return double.tryParse(clean) ?? 0.0;
    }

    final totalGb = parse(space.totalSize);
    final freeGb  = parse(space.freeSize);
    final usedGb  = (totalGb - freeGb).clamp(0.0, totalGb);

    final cacheDir   = await getTemporaryDirectory();
    final appDocsDir = await getApplicationDocumentsDirectory();

    final cacheGb    = await _dirSizeGb(cacheDir);
    final downloadGb = await _dirSizeGb(appDocsDir);
    final otherGb    = (usedGb - cacheGb - downloadGb).clamp(0.0, usedGb);

    return StorageModel(
      totalSizeGb:     totalGb,
      freeSizeGb:      freeGb,
      usedSizeGb:      usedGb,
      downloadsSizeGb: downloadGb,
      cacheSizeGb:     cacheGb,
      otherSizeGb:     otherGb,
    );
  }

  @override
  Future<void> clearCache() async {
    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      await for (final entity in cacheDir.list()) {
        try {
          await entity.delete(recursive: true);
        } on FileSystemException {
          // ignore individual errors
        }
      }
    }
  }

  Future<double> _dirSizeGb(Directory dir) async {
    var total = 0;
    try {
      if (!dir.existsSync()) return 0;
      await for (final entity in dir.list(recursive: true, followLinks: false)) {
        if (entity is File) total += entity.lengthSync();
      }
    } on FileSystemException {
      // ignore permission errors
    }
    return total / (1024 * 1024 * 1024);
  }
}
