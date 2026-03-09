import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/dimentions/spacings.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/global/resources/mock_data.dart';
import 'package:sonora/presentation/search/widget/artist_chip.dart';

class ArtistsSection extends StatelessWidget {
  const ArtistsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RPadding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Artists',
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
          ),
          Spacing.vertical(16),
          SizedBox(
            height: 130.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 16),
              itemCount: MockData.artists.length,
              separatorBuilder: (_, _) => Spacing.horizontal(16),
              itemBuilder: (context, i) {
                final a = MockData.artists[i];
                return ArtistChip(name: a['name']!, imageUrl: a['image']!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
