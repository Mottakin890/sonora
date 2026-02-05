import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/themes/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.cPrimary,
      brightness: Brightness.light,
    ),

    fontFamily: 'Satoshi',
    scaffoldBackgroundColor: AppColors.cLightBg,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cPrimary,
        textStyle: TextStyle(fontSize: 20.sp, fontWeight: .bold),
        shape: RoundedRectangleBorder(borderRadius: .circular(30.r)),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.cPrimary,
      brightness: Brightness.dark,
    ),

    fontFamily: 'Satoshi',
    scaffoldBackgroundColor: AppColors.cDarkBg,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cPrimary,
        textStyle: TextStyle(fontSize: 20.sp, fontWeight: .bold),
        shape: RoundedRectangleBorder(borderRadius: .circular(30.r)),
      ),
    ),
  );
}
