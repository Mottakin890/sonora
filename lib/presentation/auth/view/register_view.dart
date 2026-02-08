import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sonora/common/themes/app_colors.dart';
import 'package:sonora/common/utils/spacings.dart';
import 'package:sonora/common/widgets/app_button.dart';
import 'package:sonora/presentation/auth/view/sign_in_screen.dart';
import 'package:sonora/presentation/auth/widgets/my_test_field.dart';

import '../../../common/resources/app_assets.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                    child: SvgPicture.asset(AppAssets.back, height: 35.h),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Align(
              alignment: .topCenter,
              child: Column(
                children: [
                  Spacing.vertical(15),
                  SvgPicture.asset(
                    AppAssets.splash,
                    height: 120.h,
                    width: 120.w,
                  ),
                ],
              ),
            ),
          ),
          RPadding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(fontSize: 30.sp, fontWeight: .w600),
                  ),
                  Spacing.vertical(10),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        'If you need any support! ',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Click here',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.cPrimary,
                            decoration: .underline,
                            decorationColor: AppColors.cPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacing.vertical(40),
                  MyTestField(hintText: 'Full Name'),
                  Spacing.vertical(10),
                  MyTestField(hintText: 'Enter Email'),
                  Spacing.vertical(10),
                  MyTestField(hintText: 'Password'),
                  Spacing.vertical(30),
                  AppButton(onPressed: () {}, title: 'Create Account'),
                ],
              ),
            ),
          ),
          Align(
            alignment: .bottomCenter,
            child: RPadding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    'Do you have account? ',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppColors.cPrimary,
                        decoration: .underline,
                        decorationColor: AppColors.cPrimary,
                        fontWeight: .w600,
                        fontSize: 14.sp,
                      ),
                    ),
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
