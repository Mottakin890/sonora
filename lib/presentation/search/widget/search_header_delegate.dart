import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/dimentions/spacings.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class SearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TextEditingController searchController;
  final bool hasText;
  final VoidCallback onClear;

  const SearchHeaderDelegate({
    required this.searchController,
    required this.hasText,
    required this.onClear,
  });

  @override
  double get minExtent => 170;
  @override
  double get maxExtent => 170;

  @override
  bool shouldRebuild(SearchHeaderDelegate oldDelegate) =>
      oldDelegate.hasText != hasText;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color:  AppColors.c122017.withValues(alpha: .95),
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                'Search',
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: AppColors.cWhite),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(50.r),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.photo_camera_outlined, color: AppColors.cGrey500, size: 26.sp),
                ),
              ),
            ],
          ),
          Spacing.vertical(10),
          Container(
            decoration: BoxDecoration(
              color: AppColors.cWhite.withValues(alpha: .12),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: TextField(
              controller: searchController,
              style:  TextStyle(color: AppColors.cWhite, fontSize: 15.sp),
              decoration: InputDecoration(
                hintText: 'What do you want to listen to?',
                hintStyle: TextStyle(color: AppColors.cUnselected, fontSize: 15.sp),
                prefixIcon: const Icon(Icons.search, color: AppColors.cUnselected),
                suffixIcon: hasText
                    ? IconButton(
                        icon: Icon(Icons.close, color: AppColors.cUnselected, size: 20.sp),
                        onPressed: onClear,
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 13),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide:  BorderSide(color: AppColors.cPrimary, width: 2.w),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
