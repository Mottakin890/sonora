import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/global/utils/widgets/app_network_image.dart';

class LibraryItemTile extends StatelessWidget {
  final Map<String, dynamic> item;

  const LibraryItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isLikedSongs = (item['isLikedSongs'] ?? false) as bool;
    final isPinned = (item['isPinned'] ?? false) as bool;
    final isCircle = (item['isCircle'] ?? false) as bool;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            _buildLeading(isLikedSongs, isCircle, item['imageUrl'] as String?),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['title'] as String,
                    style: TextStyle(
                      color: AppColors.cWhite,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      if (isPinned) ...[
                        const Icon(
                          Icons.push_pin,
                          color: AppColors.cSpotifyGreen,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                      ],
                      Expanded(
                        child: Text(
                          item['subtitle'] as String,
                          style: TextStyle(
                            color: AppColors.cTextSecondary,
                            fontSize: 14.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeading(bool isLikedSongs, bool isCircle, String? imageUrl) {
    if (isLikedSongs) {
      return Container(
        height: 56.h,
        width: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF450af5), Color(0xFFc4efd9)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF450af5).withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.favorite,
          color: Colors.white,
          size: 28,
        ),
      );
    }

    return Container(
      height: 56.h,
      width: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isCircle ? 99.r : 8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AppNetworkImage(
        imageUrl: imageUrl ?? '',
        fit: BoxFit.cover,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? 99.r : 8.r,
      ),
    );
  }
}
