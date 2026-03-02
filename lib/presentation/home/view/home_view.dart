import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sonora/global/resources/app_assets.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/global/utils/widgets/common_app_bar.dart';
import 'package:sonora/presentation/home/widget/popular_songs_widget.dart';
import 'package:sonora/presentation/home/widget/recommended_widget.dart';
import 'package:sonora/presentation/home/widget/top_banner_widget.dart';

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
        action: [
          RPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SvgPicture.asset(
              AppAssets.scanSvg,
              colorFilter: const ColorFilter.mode(
                AppColors.textSecondary,
                BlendMode.srcIn,
              ),
              height: 28.h,
              width: 28.w,
            ),
          ),
        ],
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

      body: const SingleChildScrollView(
        child: Column(
          children: [
            RPadding(
              padding: EdgeInsets.all(8.0),
              child: TopBannerWidget(),
            ),
            RPadding(
              padding: EdgeInsets.all(6.0),
              child: RecommendedWidget(),
            ),
            RPadding(
              padding: EdgeInsets.all(6.0),
              child: PopularSongsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
