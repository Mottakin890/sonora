import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/themes/app_colors.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/widgets/app_button.dart';
import 'package:sonora/presentation/auth/bloc/auth_bloc.dart';
import 'package:sonora/presentation/auth/bloc/auth_event.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Enjoy Listening to Music',
          style: TextStyle(
            fontWeight: .w600,
            fontSize: 25.sp,
            color: AppColors.cLightBg,
          ),
        ),
        Spacing.vertical(25),
        Text(
          'Want to discover new music?',
          style: TextStyle(
            fontWeight: .w400,
            fontSize: 17.sp,
            color: AppColors.cGrey,
          ),
        ),
        Spacing.vertical(10),
        Text(
          'Find music that you will love today! Choose our curated playlists, new albums or get personalized music recommendations.',
          textAlign: .center,
          style: TextStyle(
            fontWeight: .w400,
            fontSize: 17.sp,
            color: AppColors.cGrey,
          ),
        ),
        Spacing.vertical(40),
        AppButton(
          onPressed: () {
            context.read<AuthBloc>().add(CompleteIntroEvent());
          },
          title: 'Get Started',
        ),
      ],
    );
  }
}
