import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/presentation/search/widget/search_result_icon_button.dart';

class StickyHeader extends StatefulWidget {
  const StickyHeader({super.key});

  @override
  State<StickyHeader> createState() => _StickyHeaderState();
}

class _StickyHeaderState extends State<StickyHeader> {
  final _controller = TextEditingController(text: 'Arctic');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Container(
      color: AppColors.cDarkGreenBg.withValues(alpha: 0.95),
      padding: REdgeInsets.fromLTRB(AppDimensions.md, top + AppDimensions.xs, AppDimensions.md, AppDimensions.sm),
      child: Column(
        children: [
          // Title row
          Row(
            children: [
              SearchResultIconButton(icon: Icons.arrow_back, onTap: () => Navigator.maybePop(context)),
               Expanded(
                child: Text(
                  'Search',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.cWhite),
                ),
              ),
              SearchResultIconButton(icon: Icons.close, onTap: () {}),
            ],
          ),
          Spacing.vertical(10),
          // Search field
          Container(
            height: 52.h,
            decoration: BoxDecoration(
              color: AppColors.cSlate800,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.cSpotifyGreen.withValues(alpha: 0.7), width: 1.5.w),
            ),
            child: Row(
              children: [
                 RPadding(
                  padding: REdgeInsets.symmetric(horizontal: 14),
                  child: Icon(Icons.search, color: AppColors.cSlate400, size: 22.sp),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: AppColors.cWhite, fontSize: 15.sp, fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    cursorColor: AppColors.cSpotifyGreen,
                  ),
                ),
                RPadding(
                  padding: REdgeInsets.only(right: AppDimensions.sm),
                  child: GestureDetector(
                    onTap: _controller.clear,
                    child:  Icon(Icons.cancel, color: AppColors.cSlate400, size: 20.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
