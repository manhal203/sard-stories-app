import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sard/core/widgets/logo.dart';
import 'package:sard/features/auth/widget/textfield.dart';
import 'package:sard/features/auth/bloc/auth_bloc.dart';
import 'package:sard/features/auth/widget/custom_error_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/core/widgets/button.dart';
import 'package:sard/routes/route_keys.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    final nameController = useTextEditingController(text: 'Manhal Alsubaie');
    final emailController = useTextEditingController(text: 'Manhal@gmail.com');
    final phoneController = useTextEditingController(text: '0501234567');
    final birthDateController = useTextEditingController(text: '2023-10-23');
    final passwordController = useTextEditingController(text: '1234');
    final isPasswordObscure = useState(true);

    final loadingKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (loadingKey.currentContext != null &&
              loadingKey.currentContext!.mounted) {
            context.pop();
          }
          switch (state) {
            case AuthInitial _:
              break;
            case LoadingState _:
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Center(
                  key: loadingKey,
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 253, 184, 81),
                  ),
                ),
              );
              break;
            case SuccessState _:
              context.go(RouteKeys.homeScreen);
            case ErrorState _:
              showDialog(
                context: context,
                builder: (context) => CustomErrorDialog(message: state.message),
              );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            child: Center(
              child: Container(
                width: orientation == Orientation.portrait ? 85.w : 60.w,
                constraints: BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Logo(),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: orientation == Orientation.portrait
                            ? 20.sp
                            : 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Gap(4.h),

                    CustomTextfield(
                      controller: nameController,
                      label: "Name",
                      icon: Icon(Icons.person),
                    ),
                    Gap(2.h),

                    CustomTextfield(
                      controller: emailController,
                      label: "Email",
                      icon: Icon(Icons.email),
                    ),
                    Gap(2.h),

                    CustomTextfield(
                      controller: phoneController,
                      label: "Phone Number",
                      icon: Icon(Icons.phone),
                      isNumber: true,
                    ),
                    Gap(2.h),

                    CustomTextfield(
                      controller: birthDateController,
                      label: "Birth Date",
                      icon: Icon(Icons.calendar_today),
                    ),
                    Gap(2.h),

                    CustomTextfield(
                      controller: passwordController,
                      label: "Password",
                      icon: Icon(
                        isPasswordObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onIconTap: () {
                        isPasswordObscure.value = !isPasswordObscure.value;
                      },
                      obscureText: isPasswordObscure.value,
                    ),
                    Gap(4.h),

                    CustomButton(
                      text: "Sign up",
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          SignUpEvent(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            birthDate: birthDateController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                    ),

                    Gap(3.h),

                    GestureDetector(
                      onTap: () {
                        context.go(RouteKeys.loginScreen);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Do you already have an account? ",
                          style: TextStyle(
                            fontSize: orientation == Orientation.portrait
                                ? 15.sp
                                : 14.sp,
                            color: Color.fromARGB(255, 74, 38, 2),
                          ),
                          children: [
                            TextSpan(
                              text: "Log in",
                              style: TextStyle(
                                fontSize: orientation == Orientation.portrait
                                    ? 15.sp
                                    : 14.sp,
                                color: Color.fromARGB(255, 236, 156, 38),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
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
