import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return SvgPicture.asset(
      'assets/images/logo.svg',
      height: orientation == Orientation.portrait ? 25.h : 20.h,
    );
  }
}
