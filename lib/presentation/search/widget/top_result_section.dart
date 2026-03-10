import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';
import 'package:sonora/presentation/search/widget/top_result_card.dart';

class TopResultSection extends StatelessWidget {
  final Map<String, String> data;

  const TopResultSection({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: REdgeInsets.fromLTRB(AppDimensions.md, AppDimensions.xl, AppDimensions.md, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Result',
            style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.cWhite),
          ),
          Spacing.vertical(10),
          TopResultCard(
            name: data['name'] ?? data['title'] ?? '',
            type: data['type'] ?? (data.containsKey('artist') ? 'Song' : 'Artist'),
            imageUrl: data['image'] ?? data['imageUrl'] ?? '',
          ),
        ],
      ),
    );
  }
}
