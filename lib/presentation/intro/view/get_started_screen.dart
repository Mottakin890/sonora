import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sonora/common/resources/app_assets.dart';
import 'package:sonora/common/themes/app_colors.dart';
import 'package:sonora/presentation/intro/widget/bottom_widget.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  Timer? _timer;
  int _currentIndex = 0;
  final List<String> _backgrounds = [AppAssets.bg1, AppAssets.bg2];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _backgrounds.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated Crossfade Background
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              key: ValueKey<int>(_currentIndex),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_backgrounds[_currentIndex]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          
          // Dark overlay
          Container(color: AppColors.cBlack.withValues(alpha: 0.15)),
          
          // Content
          Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  AppAssets.splash,
                  height: 150.h,
                  width: 150.w,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: BottomWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}