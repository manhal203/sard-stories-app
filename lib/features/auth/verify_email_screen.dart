import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:sard/core/widgets/logo.dart';
import 'package:sizer/sizer.dart';
import 'package:gap/gap.dart';
import 'package:sard/core/widgets/button.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
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
                    "Verify Email",
                    style: TextStyle(
                      fontSize: orientation == Orientation.portrait
                          ? 20.sp
                          : 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Gap(4.h),

                  OtpTextField(
                    numberOfFields: 4,
                    fieldWidth: orientation == Orientation.portrait
                        ? 14.w
                        : 10.w,
                    fieldHeight: orientation == Orientation.portrait
                        ? 7.h
                        : 9.h,
                    borderColor: Color.fromARGB(255, 74, 38, 2),
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            iconColor: Color(0xFFF3EFEB),
                            title: Text(
                              'Code entered is $verificationCode',
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: orientation == Orientation.portrait
                                    ? 16.sp
                                    : 14.sp,
                                fontWeight: FontWeight.bold,

                                color: Color.fromARGB(255, 74, 38, 2),
                              ),
                            ),
                          );
                        },
                      );
                    }, // end onSubmit
                  ),
                  Gap(4.h),
                  CustomButton(text: "verify", onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
