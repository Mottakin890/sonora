import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';

class SongItem extends StatefulWidget {
  final String title;
  final String artist;
  final String imageUrl;
  const SongItem({super.key, required this.title, required this.artist, required this.imageUrl});

  @override
  State<SongItem> createState() => _SongItemState();
}

class _SongItemState extends State<SongItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _hovered = true),
      onTapUp: (_) => setState(() => _hovered = false),
      onTapCancel: () => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: REdgeInsets.all(10),
        margin: REdgeInsets.only(bottom: AppDimensions.xxs),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.cSlate800.withValues(alpha: 0.5) :AppColors.cTransparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.network(
                widget.imageUrl,
                width: 48.w,
                height: 48.h,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 48.w, height: 48.h,
                  color: AppColors.cSlate700,
                ),
              ),
            ),
            Spacing.horizontal(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, color: AppColors.cWhite),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacing.vertical(2),
                  Text(
                    widget.artist,
                    style:  TextStyle(fontSize: 13.sp, color:AppColors.cSlate400),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.more_vert,
              color: _hovered ? AppColors.cSpotifyGreen : AppColors.cSlate400,
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
