import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/resources/app_assets.dart';
import 'package:sonora/global/utils/pages/pages.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_event.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_state.dart';
import 'package:sonora/presentation/dashboard/widgets/bar_items.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  List<Widget> get _pages => const [
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
              child: BlocBuilder<DashboardBloc, DashboardState>(
                buildWhen: (previous, current) =>
                    previous.tabIndex != current.tabIndex,
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BarItems(
                        icon: AppAssets.home,
                        filledIcon: AppAssets.filledHome,
                        isSelected: state.tabIndex == 0,
                        label: 'Home',
                        onTap: () => context.read<DashboardBloc>().add(
                          const DashboardPageChanged(tabIndex: 0),
                        ),
                      ),
                      BarItems(
                        icon: AppAssets.search,
                        filledIcon: AppAssets.filledSearch,
                        isSelected: state.tabIndex == 1,
                        label: 'Search',
                        onTap: () => context.read<DashboardBloc>().add(
                          const DashboardPageChanged(tabIndex: 1),
                        ),
                      ),
                      BarItems(
                        icon: AppAssets.library,
                        filledIcon: AppAssets.filledLibrary,
                        isSelected: state.tabIndex == 2,
                        label: 'Library',
                        onTap: () => context.read<DashboardBloc>().add(
                          const DashboardPageChanged(tabIndex: 2),
                        ),
                      ),
                      BarItems(
                        icon: AppAssets.setting,
                        filledIcon: AppAssets.filledSetting,
                        isSelected: state.tabIndex == 3,
                        label: 'Settings',
                        onTap: () => context.read<DashboardBloc>().add(
                          const DashboardPageChanged(tabIndex: 3),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
