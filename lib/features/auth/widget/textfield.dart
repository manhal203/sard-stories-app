import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget? icon;
  final bool obscureText;
  final bool isNumber;
  final VoidCallback? onIconTap;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.isNumber = false,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return SizedBox(
      width: orientation == Orientation.portrait ? 85.w : 60.w,
      height: orientation == Orientation.portrait ? 6.h : 9.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,

          style: TextStyle(
            fontSize: orientation == Orientation.portrait ? 18.sp : 16.sp,
          ),
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: icon != null
                ? GestureDetector(
                    onTap: onIconTap, // هنا نربط التغيير
                    child: icon,
                  )
                : null,

            focusedBorder: OutlineInputBorder(
              borderRadius: .circular(12),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 247, 172, 58),
                width: 2,
              ),
            ),
          ),
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    );
  }
}
