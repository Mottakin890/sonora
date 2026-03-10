import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';

class SettingToggleTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingToggleTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await HapticFeedback.lightImpact();
        onChanged(!value);
      },
      child: RPadding(
        padding: REdgeInsets.symmetric(horizontal: AppDimensions.md, vertical: AppDimensions.sm),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.cWhite,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null) ...[
                    Spacing.vertical(2),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: AppColors.cTextSecondary,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Spacing.horizontal(16),
            Switch(
              value: value,
              onChanged: (val) async {
                await HapticFeedback.lightImpact();
                onChanged(val);
              },
              activeThumbColor: AppColors.cPrimary,
              activeTrackColor: AppColors.cPrimary.withValues(alpha: 0.3),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: AppColors.cSlate700,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingNavigationTile extends StatelessWidget {
  final String title;
  final String? valueText;
  final IconData? icon;
  final VoidCallback onTap;

  const SettingNavigationTile({
    super.key,
    required this.title,
    this.valueText,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await HapticFeedback.lightImpact();
        onTap();
      },
      child: RPadding(
        padding: REdgeInsets.symmetric(horizontal: AppDimensions.md, vertical: AppDimensions.sm),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.cSlate400, size: 24),
              Spacing.horizontal(16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.cWhite,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (valueText != null) ...[
                    Spacing.vertical(2),
                    Text(
                      valueText!,
                      style: TextStyle(
                        color: AppColors.cPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Spacing.horizontal(16),
            const Icon(
              Icons.chevron_right,
              color: AppColors.cSlate400,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
