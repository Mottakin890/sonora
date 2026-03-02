import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/dimentions/app_spacings.dart';
import 'package:sonora/presentation/home/widget/home_song_card.dart';

class PopularSongsWidget extends StatelessWidget {
  const PopularSongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Popular albums and singles',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Spacing.vertical(6),
        SizedBox(
          height: 210.h,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              return const HomeSongCard();
            },
            separatorBuilder: (context, index) {
              return Spacing.horizontal(6);
            },
          ),
        ),
      ],
    );
  }
}
