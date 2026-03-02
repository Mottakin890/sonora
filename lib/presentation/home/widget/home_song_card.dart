import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/resources/app_assets.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class HomeSongCard extends StatelessWidget {
  const HomeSongCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145.w,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.r),
                topRight: Radius.circular(6.r),
              ),

              child: Container(
                height: 145.h,
                foregroundDecoration: BoxDecoration(
                  color: AppColors.onPrimary.withValues(alpha: 0.15),
                ),
                child: Image.asset(
                  AppAssets.demoJpeg,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          RPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ).copyWith(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Pal Pal',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Talwiinder',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondary
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
