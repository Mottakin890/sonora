import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sonora/common/resources/app_assets.dart';
import 'package:sonora/common/widgets/global_app_bar.dart';
import 'package:sonora/domain/entities/user_entities.dart';
import 'package:sonora/presentation/home/widget/home_header.dart';

class HomeView extends StatefulWidget {
  final UserEntities user;
  const HomeView({super.key, required this.user});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: GlobalAppBar(
        isDark: isDark,
        appBarTitleWidget: SvgPicture.asset(
          AppAssets.splash,
          height: 120.h,
          width: 120.w,
        ),
        leading: SvgPicture.asset(
          AppAssets.search,
          height: 27.h,
          width: 27.w,
        ),
        onTapLeading: () {},
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.ellipsis_vertical,
              size: 27.sp,
            ),
          ),
        ],
      ),
      body: const RPadding(
        padding: EdgeInsets.all(25),
        child: HomeHeader(),
      ),
    );
  }
}
