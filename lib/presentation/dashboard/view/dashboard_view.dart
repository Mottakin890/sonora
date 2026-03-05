import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/resources/app_assets.dart';
import 'package:sonora/global/utils/dependency_injection/dependency_injection.dart';
import 'package:sonora/global/utils/pages/pages.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_event.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_state.dart';
import 'package:sonora/presentation/dashboard/widgets/bar_items.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  // FIX 1: static const so the list is created once, not on every build call
  static const List<Widget> _pages = [
    HomeView(),
    SearchView(),
    LibraryView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<DashboardBloc, DashboardState>(
        buildWhen: (previous, current) => previous.tabIndex != current.tabIndex,
        builder: (context, state) {
          return IndexedStack(
            index: state.tabIndex,
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 24),
        decoration: const BoxDecoration(
          color: AppColors.cTransparent,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 64.h,
              padding: const EdgeInsets.symmetric(horizontal: 28),
              decoration: BoxDecoration(
                color: AppColors.cPrimary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(
                  color: AppColors.cUnselected,
                  width: 1.w,
                ),
              ),
              // FIX 3: Use BlocSelector per item so only the changed item rebuilds
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocSelector<DashboardBloc, DashboardState, bool>(
                    selector: (state) => state.tabIndex == 0,
                    builder: (context, isSelected) {
                      return BarItems(
                        icon: AppAssets.home,
                        filledIcon: AppAssets.filledHome,
                        isSelected: isSelected,
                        label: 'Home',
                        onTap: () => sl<DashboardBloc>().add(
                          const DashboardPageChanged(tabIndex: 0),
                        ),
                      );
                    },
                  ),
                  BlocSelector<DashboardBloc, DashboardState, bool>(
                    selector: (state) => state.tabIndex == 1,
                    builder: (context, isSelected) {
                      return BarItems(
                        icon: AppAssets.search,
                        filledIcon: AppAssets.filledSearch,
                        isSelected: isSelected,
                        label: 'Search',
                        onTap: () => sl<DashboardBloc>().add(
                          const DashboardPageChanged(tabIndex: 1),
                        ),
                      );
                    },
                  ),
                  BlocSelector<DashboardBloc, DashboardState, bool>(
                    selector: (state) => state.tabIndex == 2,
                    builder: (context, isSelected) {
                      return BarItems(
                        icon: AppAssets.library,
                        filledIcon: AppAssets.filledLibrary,
                        isSelected: isSelected,
                        label: 'Library',
                        onTap: () => sl<DashboardBloc>().add(
                          const DashboardPageChanged(tabIndex: 2),
                        ),
                      );
                    },
                  ),
                  BlocSelector<DashboardBloc, DashboardState, bool>(
                    selector: (state) => state.tabIndex == 3,
                    builder: (context, isSelected) {
                      return BarItems(
                        icon: AppAssets.setting,
                        filledIcon: AppAssets.filledSetting,
                        isSelected: isSelected,
                        label: 'Settings',
                        onTap: () => sl<DashboardBloc>().add(
                          const DashboardPageChanged(tabIndex: 3),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
