import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';
import 'package:sonora/presentation/search/widget/recent_search_item.dart';
import 'package:sonora/presentation/search/widget/top_result_section.dart';

class SearchResultsSection extends StatelessWidget {
  final List<MediaEntities> songs;
  final List<MediaEntities> artists;

  const SearchResultsSection({
    super.key,
    required this.songs,
    required this.artists,
  });

  @override
  Widget build(BuildContext context) {
    final topResult = artists.isNotEmpty ? artists.first : (songs.isNotEmpty ? songs.first : null);

    if (topResult == null) {
      return SliverToBoxAdapter(
        child: RPadding(
          padding: REdgeInsets.only(top: 100),
          child: Center(
            child: Text(
              'No results found',
              style: TextStyle(color: AppColors.cTextSecondary, fontSize: 16.sp),
            ),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildListDelegate([
        TopResultSection(data: topResult),
        
        if (songs.isNotEmpty) ...[
          RPadding(
            padding: REdgeInsets.fromLTRB(AppDimensions.md, AppDimensions.xl, AppDimensions.md, AppDimensions.sm),
            child: Text(
              'Songs',
              style: TextStyle(
                color: AppColors.cWhite,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...songs.take(5).map((song) => RecentSearchItem(
                name: song.title,
                type: 'Song • ${song.subtitle}',
                imageUrl: song.imageUrl,
                onRemove: null, // No remove button in search results
              )),
        ],

        if (artists.length > (artists.first == topResult ? 1 : 0)) ...[
          RPadding(
            padding: REdgeInsets.fromLTRB(AppDimensions.md, AppDimensions.xl, AppDimensions.md, AppDimensions.sm),
            child: Text(
              'Artists',
              style: TextStyle(
                color: AppColors.cWhite,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...artists
              .where((a) => a != topResult)
              .take(5)
              .map((artist) => RecentSearchItem(
                    name: artist.title,
                    type: 'Artist',
                    imageUrl: artist.imageUrl,
                    onRemove: null,
                  )),
        ],
      ]),
    );
  }
}
