import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/themes/app_colors.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/widgets/app_button.dart';
import 'package:sonora/presentation/auth/view/sign_in_screen.dart';
import 'package:sonora/presentation/auth/widgets/my_app_bar.dart';
import 'package:sonora/presentation/auth/widgets/my_test_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(
                'Register',
                style: TextStyle(fontWeight: .w600, fontSize: 30.sp),
              ),
              Spacing.vertical(10),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    'If you need support! ',
                    style: TextStyle(fontWeight: .w400, fontSize: 12.sp),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Click here',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: .w600,
                        color: AppColors.cPrimary,
                        decoration: .underline,
                        decorationColor: AppColors.cPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              Spacing.vertical(50),
              RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: MyTestField(hintText: 'Full Name'),
              ),
              Spacing.vertical(6),
              RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: MyTestField(hintText: 'Enter Email'),
              ),
              Spacing.vertical(6),
              RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: MyTestField(hintText: 'Enter Password', obsecureText: true,),
              ),
              Spacing.vertical(30),
              RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: AppButton(onPressed: () {}, title: 'Create Account'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RPadding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Text('Already have an account? ', style: TextStyle(fontSize: 14.sp)),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
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
    );
  }
}
