import 'package:flutter/material.dart';
import 'package:sard/core/widgets/logo.dart';
import 'package:sard/features/about/widgets/about_text.dart';
import 'package:sard/features/about/widgets/about_title.dart';
import 'package:sizer/sizer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Logo(),

              SizedBox(height: 3.h),

              Text(
                "Sard App",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 2.h),

              Text(
                "An application that provides a collection of engaging stories for children in a simple and attractive way, offering a comfortable reading experience suitable for all ages.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  height: 1.6,
                  color: Colors.grey.shade700,
                ),
              ),

              SizedBox(height: 4.h),

              AboutTitle(title: "Goal"),
              SizedBox(height: 1.h),
              AboutText(
                text:
                    "To encourage children to develop a love for reading through educational and entertaining stories.",
              ),

              SizedBox(height: 3.h),

              AboutTitle(title: "Developer"),
              SizedBox(height: 1.h),
              AboutText(
                text: "This application was developed by Manhal Alsubaie.",
              ),

              SizedBox(height: 3.h),

              AboutTitle(title: "Version"),
              SizedBox(height: 1.h),
              AboutText(text: "Version 0.1.0+1"),

              SizedBox(height: 5.h),

              Text(
                "Thank you for using the app",
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
