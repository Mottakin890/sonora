import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class SettingSectionHeader extends StatelessWidget {
  final String title;

  const SettingSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: REdgeInsets.only(left: 16, right: 16, top: 24, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: AppColors.cPrimary,
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
