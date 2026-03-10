import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';

class TopFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const TopFilterChip({
    super.key,
    required this.label,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.cPrimary
              : AppColors.cSlate800.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(
            color: selected ? AppColors.cPrimary : Colors.transparent,
            width: 1,
          ),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: selected ? AppColors.cDarkGreenBg : AppColors.cTextPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
