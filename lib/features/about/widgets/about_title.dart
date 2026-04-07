import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutTitle extends StatelessWidget {
  final String title;

  const AboutTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
    );
  }
}
