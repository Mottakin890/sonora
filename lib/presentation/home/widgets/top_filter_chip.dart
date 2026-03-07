import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/global/utils/widgets/glass_box.dart';

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
      child: GlassBox(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        borderRadius: BorderRadius.circular(50.r),
        backgroundColor: selected
            ? AppColors.cPrimary
            : AppColors.c1E293B.withValues(alpha: 0.3),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? AppColors.c122017 : AppColors.cTextPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
          ),
        ),
      ),
    );
  }
}
