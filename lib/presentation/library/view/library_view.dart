import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/resources/mock_data.dart';
import 'package:sonora/global/utils/dimentions/spacings.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/presentation/home/widgets/top_filter_chip.dart';
import 'package:sonora/presentation/library/widget/library_header.dart';
import 'package:sonora/presentation/library/widget/library_item_tile.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  String selectedFilter = 'Playlists';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cDarkGreenBg,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const LibraryHeader(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 44.h,
                  child: ListView.separated(
                    itemCount: MockData.libraryFilters.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    separatorBuilder: (context, index) => Spacing.horizontal(8),
                    itemBuilder: (context, index) {
                      final label = MockData.libraryFilters[index];
                      return TopFilterChip(
                        label: label,
                        selected: selectedFilter == label,
                        onTap: () {
                          setState(() {
                            selectedFilter = label;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 8, bottom: 100),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return LibraryItemTile(
                        item: MockData.libraryItems[index],
                      );
                    },
                    childCount: MockData.libraryItems.length,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 110.h,
            right: 16.w,
            child: Container(
              height: 56.h,
              width: 56.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.cSpotifyGreen, Color(0xFF1ed760)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.cSpotifyGreen.withValues(alpha: 0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(99),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.cDarkGreenBg,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
