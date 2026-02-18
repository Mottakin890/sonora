import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sonora/common/resources/app_assets.dart';
import 'package:sonora/common/themes/app_colors.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cPrimary,
        borderRadius: .circular(30.r),
      ),
      child: Stack(
        children: [
          RPadding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: .centerLeft,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'New Album',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: .bold,
                      fontSize: 10.sp,
                    ),
                  ),
                  Spacing.vertical(4),
                  Text(
                    'Something New',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: .bold,
                      fontSize: 19.sp,
                    ),
                  ),
                  Spacing.vertical(4),
                  Text(
                    'The Weeked',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: .bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: .topRight,
            child: SvgPicture.asset(
              AppAssets.bg6,
              colorFilter: const ColorFilter.mode(
                AppColors.cF7F8F8,
                BlendMode.srcIn,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scaleByDouble(-1.0, 1.0, 1.0, 1.0),
              child: Image.asset(AppAssets.bg3, ),
            ),
          ),
        ],
      ),
    );
  }
}
