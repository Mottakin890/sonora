import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/global/utils/widgets/common_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Row(
          children: [
            RPadding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              child: Container(
                height: 30.h,
                width: 45.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: .circular(30.r),
                ),
                child: Center(
                  child: Text(
                    'All',
                    style: TextStyle(fontSize: 12.sp, fontWeight: .w400),
                  ),
                ),
              ),
            ),

            RPadding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              child: Container(
                height: 30.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: AppColors.textDisabled,
                  borderRadius: .circular(30.r),
                ),
                child: Center(
                  child: Text(
                    'Music',
                    style: TextStyle(fontSize: 12.sp, fontWeight: .w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
