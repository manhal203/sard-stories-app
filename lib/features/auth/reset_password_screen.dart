import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/core/widgets/logo.dart';
import 'package:sard/features/auth/widget/textfield.dart';
import 'package:sard/routes/route_keys.dart';
import 'package:sizer/sizer.dart';
import 'package:gap/gap.dart';
import 'package:sard/core/widgets/button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final emailController = TextEditingController(text: "Manhal@gmail.com");

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: orientation == Orientation.portrait ? 85.w : 60.w,
              constraints: BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Logo(),
                  Text(
                    "Reset Passsword",
                    style: TextStyle(
                      fontSize: orientation == Orientation.portrait
                          ? 20.sp
                          : 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Gap(4.h),

                  CustomTextfield(
                    controller: emailController,
                    label: "Email",
                    icon: Icon(Icons.email),
                  ),

                  Gap(4.h),

                  CustomButton(
                    text: "Send",
                    onPressed: () {
                      context.push(RouteKeys.verifyEmailScreen);
                    },
                  ),

                  Gap(5.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
