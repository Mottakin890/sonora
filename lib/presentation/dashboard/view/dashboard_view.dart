import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/resources/app_assets.dart';
import 'package:sonora/common/utils/dependency_injection/dependency_injection.dart';
import 'package:sonora/common/utils/exports/pages.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';
import 'package:sonora/common/utils/widgets/glass_box.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_event.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_state.dart';
import 'package:sonora/presentation/dashboard/widgets/bar_items.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static final List<Widget> _pages = [
    const HomeView(),
    const SearchView(),
    const LibraryView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<DashboardBloc, DashboardState>(
        buildWhen: (previous, current) => previous.tabIndex != current.tabIndex,
        builder: (context, state) {
          return RepaintBoundary(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: _pages[state.tabIndex],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: REdgeInsets.symmetric(horizontal: 60, vertical: AppDimensions.xl),
        decoration: const BoxDecoration(
          color: AppColors.cTransparent,
        ),
        child: GlassBox(
          borderRadius: BorderRadius.circular(50.r),
          height: 64.h,
          padding: REdgeInsets.symmetric(horizontal: 28),
          borderColor: AppColors.cUnselected,
          borderWidth: 1.w,
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
                    onTap: () async {
                      await HapticFeedback.lightImpact();
                      sl<DashboardBloc>().add(
                        const DashboardPageChanged(tabIndex: 0),
                      );
                    },
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
                    onTap: () async {
                      await HapticFeedback.lightImpact();
                      sl<DashboardBloc>().add(
                        const DashboardPageChanged(tabIndex: 1),
                      );
                    },
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
                    onTap: () async {
                      await HapticFeedback.lightImpact();
                      sl<DashboardBloc>().add(
                        const DashboardPageChanged(tabIndex: 2),
                      );
                    },
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
                    onTap: () async {
                      await HapticFeedback.lightImpact();
                      sl<DashboardBloc>().add(
                        const DashboardPageChanged(tabIndex: 3),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
