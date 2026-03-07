import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/global/utils/dimentions/spacings.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/global/utils/widgets/app_network_image.dart';

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
          AppNetworkImage(
            imageUrl: media.imageUrl,
            width: 140.w,
            height: 140.h,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircle ? 0 : 8.r,
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
