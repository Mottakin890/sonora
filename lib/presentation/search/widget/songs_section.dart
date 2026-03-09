import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/dimentions/spacings.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/global/resources/mock_data.dart';
import 'package:sonora/presentation/search/widget/song_item.dart';

class SongsSection extends StatelessWidget {
  const SongsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text(
                'Songs',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.cWhite),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See all',
                  style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: AppColors.cSpotifyGreen),
                ),
              ),
            ],
          ),
          Spacing.vertical(12),
          ...MockData.songs.map((s) => SongItem(title: s['title']!, artist: s['artist']!, imageUrl: s['image']!)),
        ],
      ),
    );
  }
}
