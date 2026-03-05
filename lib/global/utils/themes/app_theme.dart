import 'package:flutter/material.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.cBackground,

    // colorScheme: const ColorScheme.dark().copyWith(
    //   primary: AppColors.primary,
    //   onPrimary: AppColors.onPrimary,
    //   secondary: AppColors.secondary,
    //   onSecondary: AppColors.onSecondary,
    //   surface: AppColors.background,
    //   onSurface: AppColors.textPrimary,
    // ),

    // appBarTheme: const AppBarTheme(
    //   backgroundColor: AppColors.background,
    //   elevation: 0,
    //   iconTheme: IconThemeData(color: AppColors.textPrimary),
    //   titleTextStyle: TextStyle(
    //     color: AppColors.textPrimary,
    //     fontSize: 20,
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),

    // cardTheme: const CardThemeData(
    //   color: AppColors.surface,
    //   elevation: 2,
    // ),

    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: AppColors.primary,
    //     foregroundColor: AppColors.onPrimary,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(30),
    //     ),
    //   ),
    // ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.cTextPrimary),
      bodyMedium: TextStyle(color: AppColors.cTextPrimary),
      bodySmall: TextStyle(color: AppColors.cTextPrimary),
    ),

    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.surface,
    //   selectedItemColor: AppColors.primary,
    //   unselectedItemColor: AppColors.textSecondary,
    //   type: BottomNavigationBarType.fixed,
    // ),
  );

    
}
