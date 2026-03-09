import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/domain/entities/storage_entity.dart';
import 'package:sonora/global/utils/dimentions/spacings.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class StorageBar extends StatelessWidget {
  final StorageEntity storageInfo;
  final VoidCallback onClearCache;

  const StorageBar({
    super.key,
    required this.storageInfo,
    required this.onClearCache,
  });

  @override
  Widget build(BuildContext context) {
    final freeGbStr = storageInfo.freeSizeGb.toStringAsFixed(1);
    final total = storageInfo.totalSizeGb;
    final downloadsFlex = total > 0 ? ((storageInfo.downloadsSizeGb / total) * 100).round().clamp(1, 98) : 20;
    final cacheFlex     = total > 0 ? ((storageInfo.cacheSizeGb     / total) * 100).round().clamp(1, 98) : 10;
    final otherFlex     = (100 - downloadsFlex - cacheFlex).clamp(1, 98);

    return RPadding(
      padding: REdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Device storage',
                style: TextStyle(color: AppColors.cWhite, fontSize: 14.sp),
              ),
              Text(
                '$freeGbStr GB free',
                style: TextStyle(color: AppColors.cTextSecondary, fontSize: 14.sp),
              ),
            ],
          ),
          Spacing.vertical(8),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: SizedBox(
              height: 8.h,
              child: Row(
                children: [
                  Expanded(flex: downloadsFlex, child: Container(color: AppColors.cPrimary)),
                  Expanded(flex: cacheFlex,     child: Container(color: AppColors.cSlate400)),
                  Expanded(flex: otherFlex,     child: Container(color: AppColors.cSlate800)),
                ],
              ),
            ),
          ),
          Spacing.vertical(12),
          Row(
            children: [
              _buildLegend(AppColors.cPrimary,    'Downloads'),
              Spacing.horizontal(16),
              _buildLegend(AppColors.cSlate400,   'Cache'),
              Spacing.horizontal(16),
              _buildLegend(AppColors.cSlate800,   'Other'),
            ],
          ),
          Spacing.vertical(24),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () async {
                await HapticFeedback.lightImpact();
                onClearCache();
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.cSlate700),
                shape: const StadiumBorder(),
                padding: REdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                'Delete cache',
                style: TextStyle(
                  color: AppColors.cWhite,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        Spacing.horizontal(6),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: AppColors.cTextSecondary,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
