import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/core/widgets/button.dart';
import 'package:sard/features/profile/widgets/profile_avatar.dart';
import 'package:sard/routes/route_keys.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              children: [
                SizedBox(height: 4.h),
                ProfileAvatar(),

                SizedBox(height: 2.h),

                Text(
                  "Manhal Alsubaie",
                  style: TextStyle(
                    fontSize: orientation == Orientation.portrait
                        ? 18.sp
                        : 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5.h),

                CustomButton(
                  text: "Personal Information",
                  onPressed: () {
                    context.push(RouteKeys.profileInfoScreen);
                  },
                ),
                SizedBox(height: 2.h),

                CustomButton(
                  text: "settings",
                  onPressed: () {
                    context.push(RouteKeys.settingsScreen);
                  },
                ),
                SizedBox(height: 2.h),

                CustomButton(
                  text: "About",
                  onPressed: () {
                    context.push(RouteKeys.aboutScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
