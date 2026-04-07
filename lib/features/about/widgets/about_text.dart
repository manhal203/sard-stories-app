import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutText extends StatelessWidget {
  final String text;

  const AboutText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13.sp,
        height: 1.6,
        color: Colors.grey.shade700,
      ),
    );
  }
}
