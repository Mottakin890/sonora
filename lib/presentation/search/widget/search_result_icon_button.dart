import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class SearchResultIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const SearchResultIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 48.w,
        height: 48.h,
        child: Icon(icon, color: AppColors.cWhite, size: 26.sp),
      ),
    );
  }
}
