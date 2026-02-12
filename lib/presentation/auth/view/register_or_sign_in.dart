import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sonora/common/resources/app_assets.dart';
import 'package:sonora/common/themes/app_colors.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/widgets/app_button.dart';
import 'package:sonora/presentation/auth/view/register_view.dart';
import 'package:sonora/presentation/auth/view/sign_in_screen.dart';

class RegisterOrSignIn extends StatelessWidget {
  const RegisterOrSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Align(
              alignment: .topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: RPadding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: isDarkMode ? AppColors.cDarkGrey : AppColors.cGrey,
                      borderRadius: .circular(50.r),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.back,
                      height: 35.h,
                      colorFilter: ColorFilter.mode(
                        isDarkMode ? AppColors.cDarkGrey : AppColors.cWhite,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: .topRight,
            child: SvgPicture.asset(AppAssets.bg5, height: 200.h, width: 200.w),
          ),
          Align(
            alignment: .bottomRight,
            child: SvgPicture.asset(AppAssets.bg4, height: 300.h, width: 300.w),
          ),
          Align(alignment: .bottomLeft, child: Image.asset(AppAssets.bg3)),
          RPadding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  SvgPicture.asset(
                    AppAssets.splash,
                    width: 180.w,
                    height: 180.h,
                  ),
                  Spacing.vertical(25),
                  Text(
                    'Enjoy listening to music',
                    style: TextStyle(fontWeight: .w600, fontSize: 26.sp),
                  ),
                  Spacing.vertical(15),
                  Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider.',
                    textAlign: .center,
                    style: TextStyle(fontWeight: .w400, fontSize: 17.sp),
                  ),

                  Spacing.vertical(40),
                  Row(
                    children: [
                      Expanded(
                        child: RPadding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 12,
                          ),
                          child: AppButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterView(),
                                ),
                              );
                            },
                            title: 'Register',
                            fontSize: 19.sp,
                            height: 60.h,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RPadding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 12,
                          ),
                          child: AppButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                            },
                            title: 'Sign In',
                            color: AppColors.cLightBg,
                            textColor: AppColors.cPrimary,
                            fontSize: 19.sp,
                            height: 60.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
