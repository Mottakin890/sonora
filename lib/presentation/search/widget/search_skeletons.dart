import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/utils/widgets/skeleton.dart';

class RecentSearchSkeleton extends StatelessWidget {
  const RecentSearchSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) => RPadding(
        padding: AppDimensions.paddingVerticalXs,
        child: Row(
          children: [
             Skeleton(width: 50.w, height: 50.h, borderRadius: 25.r),
            Spacing.horizontal(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(height: 14.h, width: 120.w),
                  Spacing.vertical(4),
                  Skeleton(height: 12.h, width: 80.w),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
