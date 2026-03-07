import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/dimentions/spacings.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/presentation/home/widgets/horizontal_list.dart';
import 'package:sonora/presentation/home/widgets/recently_played.dart';
import 'package:sonora/presentation/home/widgets/section_header.dart';
import 'package:sonora/presentation/home/widgets/top_filter_chip.dart';
import 'package:sonora/presentation/home/widgets/time_based_header.dart';
import 'package:sonora/global/utils/widgets/glass_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/presentation/home/bloc/home_bloc.dart';
import 'package:sonora/presentation/home/bloc/home_state.dart';
import 'package:sonora/presentation/home/bloc/home_event.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF122017),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // ── Sticky Header
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: GlassBox(
                    backgroundColor: AppColors.cCC122017,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        children: [
                          TopFilterChip(
                            label: 'All',
                            selected: selectedFilter == 'All',
                            onTap: () => context.read<HomeBloc>().add(
                                  const HomeFilterChanged('All'),
                                ),
                          ),
                          Spacing.horizontal(8),
                          TopFilterChip(
                            label: 'Music',
                            selected: selectedFilter == 'Music',
                            onTap: () => context.read<HomeBloc>().add(
                                  const HomeFilterChanged('Music'),
                                ),
                          ),
                          Spacing.horizontal(8),
                          TopFilterChip(
                            label: 'Artist',
                            selected: selectedFilter == 'Artist',
                            onTap: () => context.read<HomeBloc>().add(
                                  const HomeFilterChanged('Artist'),
                                ),
                          ),
                          Spacing.horizontal(8),
                          TopFilterChip(
                            label: 'Playlist',
                            selected: selectedFilter == 'Playlist',
                            onTap: () => context.read<HomeBloc>().add(
                                  const HomeFilterChanged('Playlist'),
                                ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              // ── Data Driven Sections
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state.status == HomeStatus.loading ||
                      state.status == HomeStatus.initial) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.cTextPrimary,
                        ),
                      ),
                    );
                  }

                  if (state.status == HomeStatus.failure) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text(
                          'Something went wrong!',
                          style: TextStyle(color: AppColors.cTextPrimary),
                        ),
                      ),
                    );
                  }

                  return SliverMainAxisGroup(
                    slivers: [
                      // ── Recently Played Grid
                      SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                childAspectRatio: 3.2,
                              ),
                          delegate: SliverChildBuilderDelegate(
                            (ctx, i) =>
                                RecentlyPlayedCard(state.recentlyPlayed[i]),
                            childCount: state.recentlyPlayed.length,
                          ),
                        ),
                      ),

                      // ── Made for You
                      const SliverToBoxAdapter(
                        child: SectionHeader('Made for You'),
                      ),
                      SliverToBoxAdapter(
                        child: HorizontalList(
                          media: state.madeForYou,
                          imageShape: BoxShape.rectangle,
                        ),
                      ),

                      // ── Jump Back In
                      const SliverToBoxAdapter(
                        child: SectionHeader('Jump back in'),
                      ),
                      SliverToBoxAdapter(
                        child: HorizontalList(
                          media: state.jumpBackIn,
                        ),
                      ),

                      // ── Recently Played
                      const SliverToBoxAdapter(
                        child: SectionHeader('Recently Played'),
                      ),
                      SliverToBoxAdapter(
                        child: HorizontalList(
                          media: state.recentlyPlayedSection,
                          imageShape: BoxShape.rectangle,
                        ),
                      ),

                      // Bottom spacing for mini player
                      SliverToBoxAdapter(child: Spacing.vertical(100)),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
