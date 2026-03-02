import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/resources/app_assets.dart';
import 'package:sonora/global/utils/dimentions/app_spacings.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class TopBannerWidget extends StatelessWidget {
  const TopBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 250.h,
        width: double.infinity,
        foregroundDecoration: BoxDecoration(
          color: AppColors.onPrimary.withValues(alpha: 0.15),
        ),
        child: RPadding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              
               Column(
                mainAxisAlignment: .center,
                 children: [
                   Text("Blinding Lights", style: TextStyle(fontSize: 28.sp, fontWeight: .w800),),
                   Row(
                    mainAxisAlignment: .spaceBetween,
                     children: [
                       Text("by",  style: TextStyle(fontSize: 12.sp, fontWeight: .w800),),
                       Spacing.horizontal(10),
                       Text("The Weekend",  style: TextStyle(fontSize: 20.sp, fontWeight: .w800),),
                     ],
                   )
                 ],
               ),
              Expanded(
                child: Image.asset(
                  AppAssets.weekendPng,
                  fit: BoxFit.contain,
                  alignment: Alignment.centerRight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
