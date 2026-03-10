import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';

class SettingSectionHeader extends StatelessWidget {
  final String title;

  const SettingSectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: REdgeInsets.fromLTRB(
        AppDimensions.md,
        AppDimensions.lg,
        AppDimensions.md,
        AppDimensions.xs,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.cWhite,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
