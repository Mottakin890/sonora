import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class GlassBox extends StatelessWidget {
  const GlassBox({
    super.key,
    required this.child,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.sigmaX = 5.0,
    this.sigmaY = 5.0,
  });

  final Widget child;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final double sigmaX;
  final double sigmaY;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? BorderRadius.zero;
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color:
                  backgroundColor ?? AppColors.cPrimary.withValues(alpha: 0.1),
              borderRadius: effectiveBorderRadius,
              border: borderColor != null
                  ? Border.all(
                      color: borderColor!,
                      width: borderWidth ?? 1.0,
                    )
                  : null,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
