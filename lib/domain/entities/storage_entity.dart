import 'package:equatable/equatable.dart';

class StorageEntity extends Equatable {
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
  List<Object?> get props => [
        totalSizeGb,
        freeSizeGb,
        usedSizeGb,
        downloadsSizeGb,
        cacheSizeGb,
        otherSizeGb,
      ];

  // Flex values for UI
  int get downloadsFlex => totalSizeGb > 0 ? ((downloadsSizeGb / totalSizeGb) * 100).round() : 0;
  int get cacheFlex => totalSizeGb > 0 ? ((cacheSizeGb / totalSizeGb) * 100).round() : 0;
  int get otherFlex => totalSizeGb > 0 ? (((usedSizeGb - downloadsSizeGb - cacheSizeGb) / totalSizeGb) * 100).round() : 0;
}
