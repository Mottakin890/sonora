import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/utils/dimentions/app_dimensions.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/utils/themes/app_colors.dart';
import 'package:sonora/presentation/search/widget/top_result_card.dart';

import 'package:sonora/domain/entities/media_entities.dart';

class TopResultSection extends StatelessWidget {
  final MediaEntities data;

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
            name: data.title,
            type: data.isCircle ? 'Artist' : (data.subtitle.contains('Playlist') || data.subtitle.contains('Album') ? data.subtitle.split('•').last.trim() : 'Song'),
            imageUrl: data.imageUrl,
          ),
        ],
      ),
    );
  }
}
