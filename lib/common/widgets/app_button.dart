import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight((height ?? 76).sp),
      ),
      child: Text(
        title,
        style: TextStyle(fontWeight: .bold, fontSize: 22.sp),
      ),
    );
  }
}
