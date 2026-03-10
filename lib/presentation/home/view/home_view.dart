import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';
import 'package:sonora/common/utils/widgets/glass_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/presentation/home/bloc/home_bloc.dart';
import 'package:sonora/presentation/home/bloc/home_state.dart';
import 'package:sonora/presentation/home/bloc/home_event.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/domain/entities/playlist_entities.dart';
import 'package:sonora/common/resources/mock_data.dart';
import 'package:sonora/presentation/home/widgets/home_skeletons.dart';
import 'package:sonora/presentation/home/widgets/horizontal_list.dart';
import 'package:sonora/presentation/home/widgets/recently_played.dart';
import 'package:sonora/presentation/home/widgets/section_header.dart';
import 'package:sonora/presentation/home/widgets/time_based_header.dart';
import 'package:sonora/presentation/home/widgets/top_filter_chip.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cDarkGreenBg,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: GlassBox(
                    backgroundColor: AppColors.cDarkGreenBg.withValues(
                      alpha: 0.8,
                    ),
                    padding: AppDimensions.paddingHorizontalMd.copyWith(top: AppDimensions.xs, bottom: AppDimensions.xs),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TimeBasedHeader(),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                toolbarHeight: 60.h,
              ),

              // ── Filter Chips
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 44.h,
                  child: BlocSelector<HomeBloc, HomeState, String>(
                    selector: (state) => state.selectedFilter,
                    builder: (context, selectedFilter) {
                      return ListView.separated(
                        itemCount: MockData.homeFilters.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: AppDimensions.paddingHorizontalMd.copyWith(top: 4, bottom: 4),
                        separatorBuilder: (context, index) =>
                            Spacing.horizontal(8),
                        itemBuilder: (context, index) {
                          final label = MockData.homeFilters[index];
                          return TopFilterChip(
                            label: label,
                            selected: selectedFilter == label,
                            onTap: () => context.read<HomeBloc>().add(
                              HomeFilterChanged(label),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),

              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  if (state.status == HomeStatus.initial ||
                      state.status == HomeStatus.loading) {
                    return const SliverToBoxAdapter(
                      child: Column(
                        children: [
                          RecentlyPlayedSkeleton(),
                          SectionSkeleton(),
                          SectionSkeleton(),
                          SectionSkeleton(),
                        ],
                      ),
                    );
                  }

                  if (state.status == HomeStatus.failure) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Failed to load data',
                          style: TextStyle(color: AppColors.cWhite),
                        ),
                      ),
                    );
                  }

                  return SliverToBoxAdapter(
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildRecentlyPlayedGrid(state.recentlyPlayed),
                          _buildSection(
                            'Made For You',
                            state.madeForYou,
                            BoxShape.rectangle,
                          ),
                          _buildSection(
                            'Jump Back In',
                            state.jumpBackIn,
                            BoxShape.circle,
                          ),
                          _buildSection(
                            'Recently Played',
                            state.recentlyPlayedSection,
                            BoxShape.rectangle,
                          ),
                          Spacing.vertical(100),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentlyPlayedGrid(List<PlaylistEntities> recentlyPlayed) {
    if (recentlyPlayed.isEmpty) return const SizedBox.shrink();
    return RPadding(
      padding: REdgeInsets.fromLTRB(
        AppDimensions.md,
        AppDimensions.xs,
        AppDimensions.md,
        0,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 3.2,
        ),
        itemCount: recentlyPlayed.length,
        itemBuilder: (context, i) => RecentlyPlayedCard(recentlyPlayed[i]),
      ),
    );
  }

  Widget _buildSection(
    String title,
    List<MediaEntities> data,
    BoxShape shape,
  ) {
    if (data.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title),
        HorizontalList(media: data, imageShape: shape),
      ],
    );
  }
}
