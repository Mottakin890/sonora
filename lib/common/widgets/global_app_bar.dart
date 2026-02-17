import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/themes/app_colors.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDark;
  final Widget appBarTitleWidget;
  final List<Widget>? actions;
  final Widget leading;
  final void Function()? onTapLeading;
  const GlobalAppBar({
    super.key,
    required this.isDark,
    required this.appBarTitleWidget,
    this.actions,
    required this.leading,
    required this.onTapLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.cTransparent,
      toolbarHeight: 80.h,
      leading: RPadding(
        padding: const EdgeInsets.only(left: 10.0),
        child: GestureDetector(
          onTap: onTapLeading,
          child: Container(
            height: 40.h,
            width: 40.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: leading,
          ),
        ),
      ),
      title: appBarTitleWidget,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
