import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class Skeleton extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderRadius;

  const Skeleton({
    super.key,
    this.height,
    this.width,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Shimmer.fromColors(
        baseColor: AppColors.cShimmerBase,
        highlightColor: AppColors.cShimmerHighlight,
        period: const Duration(milliseconds: 1500),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.cSkeletonBackground,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
      ),
    );
  }
}
