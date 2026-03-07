import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/presentation/search/bloc/search_bloc.dart';
import 'package:sonora/presentation/search/bloc/search_event.dart';
import 'package:sonora/presentation/search/bloc/search_state.dart';
import 'package:sonora/presentation/search/widget/category_card.dart';
import 'package:sonora/presentation/search/widget/recent_search_item.dart';
import 'package:sonora/presentation/search/widget/search_header_delegate.dart';
import 'package:sonora/presentation/search/widget/search_skeletons.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(const LoadSearchData());
    _searchController.addListener(() {
      context.read<SearchBloc>().add(SearchQueryChanged(_searchController.text));
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Color _hexToColor(String hexStr) {
    final hex = hexStr.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c122017,
      body: BlocListener<SearchBloc, SearchState>(
        listenWhen: (previous, current) =>
            previous.query.isNotEmpty && current.query.isEmpty,
        listener: (context, state) {
          if (_searchController.text.isNotEmpty) {
            _searchController.clear();
          }
        },
        child: CustomScrollView(
          slivers: [
            // Sticky Header
            BlocSelector<SearchBloc, SearchState, bool>(
              selector: (state) => state.query.isNotEmpty,
              builder: (context, hasText) {
                return SliverPersistentHeader(
                  pinned: true,
                  delegate: SearchHeaderDelegate(
                    searchController: _searchController,
                    hasText: hasText,
                    onClear: () {
                      context.read<SearchBloc>().add(const ClearSearch());
                    },
                  ),
                );
              },
            ),

            // Body Content
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 48),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 8),
                  // Recent Searches Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent searches',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey[400],
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'See all',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Recent search items
                  BlocBuilder<SearchBloc, SearchState>(
                    buildWhen: (previous, current) =>
                        previous.status != current.status ||
                        previous.recentSearches != current.recentSearches,
                    builder: (context, state) {
                      if ((state.status == SearchStatus.loading ||
                              state.status == SearchStatus.initial) &&
                          state.recentSearches.isEmpty) {
                        return const RecentSearchSkeleton();
                      }
                      return Column(
                        children:
                            List.generate(state.recentSearches.length, (index) {
                          final item = state.recentSearches[index];
                          return RecentSearchItem(
                            key: ValueKey(item['name']),
                            name: item['name']!,
                            type: item['type']!,
                            imageUrl: item['imageUrl']!,
                            onRemove: () {
                              context
                                  .read<SearchBloc>()
                                  .add(RemoveRecentSearch(index));
                            },
                          );
                        }),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Browse All Header
                  const Text(
                    'Browse all',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 16),

                  // Category Grid
                  BlocBuilder<SearchBloc, SearchState>(
                    buildWhen: (previous, current) =>
                        previous.status != current.status ||
                        previous.categories != current.categories,
                    builder: (context, state) {
                      if ((state.status == SearchStatus.loading ||
                              state.status == SearchStatus.initial) &&
                          state.categories.isEmpty) {
                        return const CategorySkeleton();
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1,
                        ),
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final cat = state.categories[index];
                          return CategoryCard(
                            key: ValueKey(cat['name']),
                            name: cat['name']!,
                            color1: _hexToColor(cat['color1']!),
                            color2: _hexToColor(cat['color2']!),
                            imageUrl: cat['imageUrl']!,
                          );
                        },
                      );
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
