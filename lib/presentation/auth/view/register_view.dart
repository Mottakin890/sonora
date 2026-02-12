import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/common/themes/app_colors.dart';
import 'package:sonora/common/utils/dimentions/spacings.dart';
import 'package:sonora/common/widgets/app_button.dart';
import 'package:sonora/presentation/auth/bloc/auth_bloc.dart';
import 'package:sonora/presentation/auth/bloc/auth_event.dart';
import 'package:sonora/presentation/auth/bloc/auth_state.dart';
import 'package:sonora/presentation/auth/view/sign_in_screen.dart';
import 'package:sonora/presentation/auth/widgets/my_app_bar.dart';
import 'package:sonora/presentation/auth/widgets/my_test_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.sp),
              ),
              Spacing.vertical(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'If you need support! ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Click here',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.cPrimary,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.cPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              Spacing.vertical(50),
              RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: MyTestField(
                  hintText: 'Full Name',
                  controller: _nameController,
                ),
              ),
              Spacing.vertical(6),
              RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: MyTestField(
                  hintText: 'Enter Email',
                  controller: _emailController,
                ),
              ),
              Spacing.vertical(6),
              RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: MyTestField(
                  hintText: 'Enter Password',
                  obsecureText: true,
                  controller: _passwordController,
                ),
              ),
              Spacing.vertical(30),
              RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return AppButton(
                      isLoading: state is AuthLoadingState,
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          SignUpEvent(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                      title: 'Create Account',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RPadding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: TextStyle(fontSize: 14.sp),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: AppColors.cPrimary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.cPrimary,
                  fontWeight: FontWeight.w600,
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
