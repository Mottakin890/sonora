import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';
import 'package:sonora/common/utils/widgets/glass_box.dart';
import 'package:sonora/presentation/settings/bloc/settings_bloc.dart';
import 'package:sonora/presentation/settings/bloc/settings_event.dart';
import 'package:sonora/presentation/settings/bloc/settings_state.dart';
import 'package:sonora/presentation/settings/widget/setting_section_header.dart';
import 'package:sonora/presentation/settings/widget/setting_tile.dart';
import 'package:sonora/presentation/settings/widget/storage_bar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cDarkGreenBg,
      body: BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.storageInfo != current.storageInfo,
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leadingWidth: 56.w,
                leading: RPadding(
                  padding: REdgeInsets.only(left: AppDimensions.md),
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50.r),
                      child: Container(
                        padding: REdgeInsets.all(AppDimensions.xs),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Icon(Icons.arrow_back, color: AppColors.cWhite),
                      ),
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: GlassBox(
                    backgroundColor: AppColors.cDarkGreenBg.withValues(alpha: 0.8),
                    child: Center(
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          color: AppColors.cWhite,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                toolbarHeight: 60.h,
              ),

              if (state.status == SettingsStatus.loading)
                const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (state.status == SettingsStatus.failure)
                SliverFillRemaining(
                  child: Center(
                    child: Text(
                      state.errorMessage ?? 'Error',
                      style: const TextStyle(color: AppColors.cTextSecondary),
                    ),
                  ),
                )
              else if (state.status == SettingsStatus.success)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final section = state.sections[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingSectionHeader(title: section['title'] as String),
                          ...(section['items'] as List<Map<String, dynamic>>)
                              .map((item) => _buildItem(context, item, state)),
                          if (index == state.sections.length - 1)
                            Spacing.vertical(120),
                        ],
                      );
                    },
                    childCount: state.sections.length,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    Map<String, dynamic> item,
    SettingsState state,
  ) {
    final type = item['type'] as String;

    switch (type) {
      case 'toggle':
        return _ToggleTileSelector(
          toggleKey: item['key'] as String,
          title: item['title'] as String,
          subtitle: item['subtitle'] as String?,
        );

      case 'navigation':
        return SettingNavigationTile(
          title: item['title'] as String,
          valueText: item['value'] as String?,
          icon: item['icon'] as IconData?,
          onTap: () {},
        );

      case 'storage':
        if (state.storageInfo == null) return const SizedBox.shrink();
        return StorageBar(
          storageInfo: state.storageInfo!,
          onClearCache: () =>
              context.read<SettingsBloc>().add(const ClearStorageCache()),
        );

      case 'info':
        return RPadding(
          padding: REdgeInsets.symmetric(horizontal: AppDimensions.md, vertical: AppDimensions.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['title'] as String,
                style: TextStyle(
                  color: AppColors.cWhite,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacing.vertical(2),
              Text(
                item['subtitle'] as String,
                style: TextStyle(
                  color: AppColors.cTextSecondary,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}

class _ToggleTileSelector extends StatelessWidget {
  final String toggleKey;
  final String title;
  final String? subtitle;

  const _ToggleTileSelector({
    required this.toggleKey,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsBloc, SettingsState, bool>(
      selector: (state) =>
          state.status == SettingsStatus.success && (state.toggles[toggleKey] ?? false),
      builder: (context, value) => SettingToggleTile(
        title: title,
        subtitle: subtitle,
        value: value,
        onChanged: (val) => context
            .read<SettingsBloc>()
            .add(ToggleSetting(key: toggleKey, value: val)),
      ),
    );
  }
}
