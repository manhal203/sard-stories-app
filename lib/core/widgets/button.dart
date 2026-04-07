import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return SizedBox(
      width: .infinity,
      height: orientation == Orientation.portrait ? 6.5.h : 7.5.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: orientation == Orientation.portrait ? 20.sp : 18.sp,
            fontWeight: .bold,
          ),
        ),
      ),
    );
  }
}
