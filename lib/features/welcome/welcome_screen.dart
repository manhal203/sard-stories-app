import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sard/core/widgets/logo.dart';
import 'package:sizer/sizer.dart';
import 'package:sard/core/widgets/button.dart';
import 'package:sard/routes/route_keys.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: orientation == Orientation.portrait ? 85.w : 60.w,
                constraints: BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Logo(),
                    Text(
                      "Fun stories for every child",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: orientation == Orientation.portrait
                            ? 20.sp
                            : 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Gap(5.h),

                    CustomButton(
                      text: "Log in",
                      onPressed: () {
                        context.push(RouteKeys.loginScreen);
                      },
                    ),

                    Gap(2.h),

                    CustomButton(
                      text: "Sign up",
                      onPressed: () {
                        context.push(RouteKeys.signupScreen);
                      },
                    ),

                    Gap(3.h),

                    Lottie.asset(
                      'assets/animations/boy fly with book.json',
                      height: orientation == Orientation.portrait ? 25.h : 30.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
