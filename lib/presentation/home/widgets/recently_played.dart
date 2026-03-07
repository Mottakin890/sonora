import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/domain/entities/playlist_entities.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/global/utils/widgets/app_network_image.dart';
import 'package:sonora/global/utils/widgets/glass_box.dart';

class RecentlyPlayedCard extends StatelessWidget {
  final PlaylistEntities platlist;
  const RecentlyPlayedCard(this.platlist, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cTransparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6.r),
        onTap: () {},
        child: GlassBox(
          borderRadius: BorderRadius.circular(6.r),
          backgroundColor: AppColors.c1E293B.withValues(alpha: 0.3),
          child: Row(
            children: [
              AppNetworkImage(
                imageUrl: platlist.imageUrl,
                width: 56.w,
                height: 56.h,
                borderRadius: 6.r,
              ),
              Expanded(
                child: RPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    platlist.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.cTextPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
