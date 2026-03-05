import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class BarItems extends StatelessWidget {
  final String icon;
  final String filledIcon;
  final bool isSelected;
  final String label;
  final VoidCallback onTap;

  const BarItems({
    super.key,
    required this.icon,
    required this.filledIcon,
    required this.isSelected,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: ColoredBox(
        color: AppColors.cTransparent,
        child: SvgPicture.asset(
          isSelected ? filledIcon : icon,
          colorFilter: ColorFilter.mode(
            isSelected ? AppColors.cPrimary : AppColors.cUnselected,
            BlendMode.srcIn,
          ),
          height: 22.h,
          width: 22.w,
        ),
      ),
    );
  }
}
