import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sard/core/widgets/logo.dart';
import 'package:sard/features/auth/widget/textfield.dart';
import 'package:sard/features/auth/bloc/auth_bloc.dart';
import 'package:sard/features/auth/widget/custom_error_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/core/widgets/button.dart';
import 'package:sard/routes/route_keys.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    final emailController = useTextEditingController(text: 'Manhal@gmail.com');
    final passwordController = useTextEditingController(text: '1234');
    final loadingKey = GlobalKey();
    final isPasswordObscure = useState(true);

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

                    Gap(3.h),

                    Text(
                      "Log in",
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

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          context.push(RouteKeys.resetPasswordScreen);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Text(
                            "Reset Passsword",
                            style: TextStyle(
                              fontSize: orientation == Orientation.portrait
                                  ? 15.sp
                                  : 14.sp,
                              color: Color.fromARGB(255, 236, 156, 38),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Gap(4.h),

                    CustomButton(
                      text: "Log in",
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          LoginEvent(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                    ),

                    Gap(3.h),

                    GestureDetector(
                      onTap: () {
                        context.go(RouteKeys.signupScreen);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontSize: orientation == Orientation.portrait
                                ? 15.sp
                                : 14.sp,
                            color: Color.fromARGB(255, 74, 38, 2),
                          ),
                          children: [
                            TextSpan(
                              text: "Create a new account",
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
