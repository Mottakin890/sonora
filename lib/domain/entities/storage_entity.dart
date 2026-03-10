import 'package:meta/meta.dart';

@immutable
class StorageEntity {
  final double totalSizeGb;
  final double freeSizeGb;
  final double usedSizeGb;
  final double downloadsSizeGb;
  final double cacheSizeGb;
  final double otherSizeGb;

  const StorageEntity({
    required this.totalSizeGb,
    required this.freeSizeGb,
    required this.usedSizeGb,
    required this.downloadsSizeGb,
    required this.cacheSizeGb,
    required this.otherSizeGb,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StorageEntity &&
          runtimeType == other.runtimeType &&
          totalSizeGb == other.totalSizeGb &&
          freeSizeGb == other.freeSizeGb &&
          usedSizeGb == other.usedSizeGb &&
          downloadsSizeGb == other.downloadsSizeGb &&
          cacheSizeGb == other.cacheSizeGb &&
          otherSizeGb == other.otherSizeGb;

  @override
  int get hashCode =>
      totalSizeGb.hashCode ^
      freeSizeGb.hashCode ^
      usedSizeGb.hashCode ^
      downloadsSizeGb.hashCode ^
      cacheSizeGb.hashCode ^
      otherSizeGb.hashCode;

  int get downloadsFlex => totalSizeGb > 0 ? ((downloadsSizeGb / totalSizeGb) * 100).round() : 0;
  int get cacheFlex => totalSizeGb > 0 ? ((cacheSizeGb / totalSizeGb) * 100).round() : 0;
  int get otherFlex => totalSizeGb > 0 ? (((usedSizeGb - downloadsSizeGb - cacheSizeGb) / totalSizeGb) * 100).round() : 0;
}
