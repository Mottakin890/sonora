import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/global/utils/dimentions/spacings.dart';
import 'package:sonora/presentation/home/widgets/media_card.dart';

class HorizontalList extends StatelessWidget {
  final List<MediaEntities> media;
  final BoxShape imageShape;

  const HorizontalList({super.key, 
    required this.media,
    this.imageShape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: media.length,
        separatorBuilder: (_, _) =>  Spacing.horizontal(16),
        itemBuilder: (ctx, i) => MediaCard(media[i], imageShape),
      ),
    );
  }
}
