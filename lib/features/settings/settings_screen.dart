import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/core/widgets/button.dart';
import 'package:sard/routes/route_keys.dart';
import 'package:sizer/sizer.dart';
import 'package:sard/features/settings/cubit/settings_cubit.dart';
import 'package:sard/features/settings/widgets/settings_card.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Preferences",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Gap(2.h),

              BlocBuilder<SettingsCubit, SettingsInitial>(
                builder: (context, state) {
                  return SettingsCard(
                    icon: Icons.dark_mode,
                    title: "Dark Mode",
                    value: state.isDarkMode,
                    onChanged: (value) {
                      context.read<SettingsCubit>().switchDarkMode(value);
                    },
                  );
                },
              ),

              BlocBuilder<SettingsCubit, SettingsInitial>(
                builder: (context, state) {
                  return SettingsCard(
                    icon: Icons.notifications,
                    title: "Notifications",
                    value: state.isNotificationsOn, 
                    onChanged: (value) {
                      context.read<SettingsCubit>().switchNotifications(value);
                    },
                  );
                },
              ),
              Gap(4.h),

              CustomButton(
                text: "Log out",
                onPressed: () {
                  context.go(RouteKeys.welcomeScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
