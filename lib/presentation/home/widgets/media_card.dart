import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/global/utils/dimentions/spacings.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class MediaCard extends StatelessWidget {
  final MediaEntities media;
  final BoxShape shape;
  const MediaCard(this.media, this.shape, {super.key});

  @override
  Widget build(BuildContext context) {
    final isCircle = media.isCircle || shape == BoxShape.circle;
    return SizedBox(
      width: 140.w,
      child: Column(
        crossAxisAlignment: isCircle
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Container(
            width: 140.w,
            height: 140.h,
            decoration: BoxDecoration(
              shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: isCircle ? null : BorderRadius.circular(8.r),
              image: DecorationImage(
                image: ResizeImage(
                  NetworkImage(media.imageUrl),
                  width: (140.w * MediaQuery.devicePixelRatioOf(context))
                      .round(),
                  height: (140.h * MediaQuery.devicePixelRatioOf(context))
                      .round(),
                ),
                fit: BoxFit.cover,
              ),
              color: AppColors.c334155,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          Spacing.vertical(8),
          Text(
            media.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: isCircle ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              color: AppColors.cTextPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
          Spacing.vertical(2),
          Text(
            media.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: isCircle ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              color: AppColors.cTextSecondary,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}
