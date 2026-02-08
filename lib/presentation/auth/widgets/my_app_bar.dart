import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sonora/common/themes/app_colors.dart';

import '../../../common/resources/app_assets.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return AppBar(
      backgroundColor: AppColors.cTransparent,
      toolbarHeight: 700.h,
      leading: RPadding(
        padding: const EdgeInsets.only(left: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.cDarkGrey : AppColors.cGrey,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AppAssets.back, height: 50.h, width: 50.h),
          ),
        ),
      ),
      title: SvgPicture.asset(AppAssets.splash, height: 120.h, width: 120.w),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
