import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/utils/widgets/skeleton.dart';

class RecentlyPlayedSkeleton extends StatelessWidget {
  const RecentlyPlayedSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: REdgeInsets.fromLTRB(AppDimensions.md, AppDimensions.xs, AppDimensions.md, 0),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 3.2,
        ),
        itemBuilder: (ctx, i) => const Skeleton(borderRadius: 6),
        itemCount: 6,
      ),
    );
  }
}

class SectionSkeleton extends StatelessWidget {
  final bool isCircle;
  const SectionSkeleton({super.key, this.isCircle = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RPadding(
          padding: REdgeInsets.fromLTRB(AppDimensions.md, AppDimensions.sm, AppDimensions.md, AppDimensions.xs),
          child: Skeleton(height: 20.h, width: 120.w),
        ),
        SizedBox(
          height: 190.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: AppDimensions.paddingHorizontalMd,
            itemCount: 5,
            separatorBuilder: (_, _) => Spacing.horizontal(16),
            itemBuilder: (ctx, i) => Column(
              crossAxisAlignment:
                  isCircle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Skeleton(
                  width: 140.w,
                  height: 140.h,
                  borderRadius: isCircle ? 70 : 8,
                ),
                Spacing.vertical(8),
                Skeleton(height: 14.h, width: 100.w),
                Spacing.vertical(4),
                Skeleton(height: 12.h, width: 70.w),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
