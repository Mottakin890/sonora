import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/common/utils/widgets/app_network_image.dart';
import 'package:sonora/presentation/search/widget/play_button.dart';

class TopResultCard extends StatelessWidget {
  final String name;
  final String type;
  final String imageUrl;

  const TopResultCard({
    super.key,
    required this.name,
    required this.type,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cCardBg,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.cWhite.withValues(alpha: .07)),
        boxShadow: [
          BoxShadow(
              color: AppColors.cBlack26.withValues(alpha: 0.35),
              blurRadius: 20,
              offset: const Offset(0, 6)),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          // Band image
          AspectRatio(
            aspectRatio: 16 / 9,
            child: AppNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Info row
          RPadding(
            padding: REdgeInsets.all(AppDimensions.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.cWhite),
                ),
                Spacing.vertical(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          REdgeInsets.symmetric(horizontal: AppDimensions.sm, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.cSlate700,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Text(
                        type.toUpperCase(),
                        style:  TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                          color: AppColors.cSlate200,
                        ),
                      ),
                    ),
                    const PlayButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
