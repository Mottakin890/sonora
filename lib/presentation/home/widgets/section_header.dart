import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: REdgeInsets.fromLTRB(AppDimensions.md, AppDimensions.sm, AppDimensions.md, AppDimensions.xs),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.cTextPrimary,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
