import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/themes/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Color? color;
  final double? fontSize;
  final Color? textColor;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
    this.color,
    this.fontSize,
    this.textColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight((height ?? 76).sp),
        backgroundColor: color ?? AppColors.cPrimary,
      ),
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
              title,
              style: TextStyle(color: textColor ?? AppColors.cLightBg),
            ),
    );
  }
}
