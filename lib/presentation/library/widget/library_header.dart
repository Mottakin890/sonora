import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';
import 'package:sonora/common/utils/widgets/glass_box.dart';

class LibraryHeader extends StatelessWidget {
  const LibraryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: GlassBox(
          backgroundColor: AppColors.cDarkGreenBg.withValues(alpha: 0.8),
          padding: AppDimensions.paddingHorizontalMd.copyWith(top: AppDimensions.xs, bottom: AppDimensions.xs),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Your Library',
                  style: TextStyle(
                    color: AppColors.cWhite,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton(
                icon:  Icon(
                  Icons.search,
                  color: AppColors.cWhite,
                  size: 28.sp,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      toolbarHeight: 60.h,
    );
  }
}
