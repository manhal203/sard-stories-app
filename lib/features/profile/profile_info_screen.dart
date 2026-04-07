import 'package:flutter/material.dart';
import 'package:sard/features/profile/widgets/info_card.dart';
import 'package:sard/features/profile/widgets/profile_avatar.dart';
import 'package:sizer/sizer.dart';
import 'package:gap/gap.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final name = "Manhal Alsubaie";
    final email = "Manhal@gmail.com";
    final phone = "0501234567";
    final birthDate = "2023-10-23";

    return Scaffold(
      appBar: AppBar(title: Text("Profile Information")),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        child: Column(
          children: [
            ProfileAvatar(),

            Gap(2.h),

            Text(
              name,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),

            Gap(3.h),

            InfoCard(icon: Icons.email, title: "Email", value: email),

            InfoCard(icon: Icons.phone, title: "Phone", value: phone),

            InfoCard(
              icon: Icons.calendar_today,
              title: "Birth Date",
              value: birthDate,
            ),
          ],
        ),
      ),
    );
  }
}
