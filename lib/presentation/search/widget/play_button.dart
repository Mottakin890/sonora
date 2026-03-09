import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({super.key});

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.94 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          height: 46.h,
          constraints:  BoxConstraints(minWidth: 100.w),
          padding: const EdgeInsets.symmetric(horizontal: 28),
          decoration: BoxDecoration(
            color: AppColors.cSpotifyGreen,
            borderRadius: BorderRadius.circular(50.r),
          ),
          alignment: Alignment.center,
          child:  Text(
            'Play',
            style: TextStyle(
              color: AppColors.cDarkGreenBg,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
