import 'package:flutter/material.dart';
import 'package:sonora/common/themes/app_colors.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({super.key});

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _controller,
      indicatorColor: AppColors.cPrimary,
      isScrollable: true,
      tabAlignment: .start,
      dividerColor: AppColors.cTransparent,
      tabs: [
        Text(
          'News',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontSize: 20, fontWeight: .bold),
        ),
        Text(
          'Video',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontSize: 20, fontWeight: .bold),
        ),
        Text(
          'Artist',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontSize: 20, fontWeight: .bold),
        ),
        Text(
          'Podcast',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontSize: 20, fontWeight: .bold),
        ),
      ],
    );
  }
}
