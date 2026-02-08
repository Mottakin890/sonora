import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/themes/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.cPrimary,
      brightness: Brightness.light,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: TextStyle(fontWeight: .w600, fontSize: 16.sp),
      contentPadding: const EdgeInsets.all(30),
      fillColor: AppColors.cTransparent,
      border: OutlineInputBorder(borderRadius: .circular(30.r)),
    ),

    fontFamily: 'Satoshi',
    scaffoldBackgroundColor: AppColors.cLightBg,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cPrimary,
        textStyle: TextStyle(fontSize: 22.sp, fontWeight: .w600, color: AppColors.cLightBg),
        foregroundColor: AppColors.cLightBg,
        shape: RoundedRectangleBorder(borderRadius: .circular(30.r)),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.cPrimary,
      brightness: Brightness.dark,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: TextStyle(fontWeight: .w600, fontSize: 16.sp),
      contentPadding: const EdgeInsets.all(30),
      fillColor: AppColors.cTransparent,
      border: OutlineInputBorder(borderRadius: .circular(30.r)),
    ),

    fontFamily: 'Satoshi',
    scaffoldBackgroundColor: AppColors.cDarkBg,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cPrimary,
        textStyle: TextStyle(fontSize: 22.sp, fontWeight: .w600, color: AppColors.cLightBg),
        foregroundColor: AppColors.cLightBg,
        shape: RoundedRectangleBorder(borderRadius: .circular(30.r)),
      ),
    ),
  );
}
