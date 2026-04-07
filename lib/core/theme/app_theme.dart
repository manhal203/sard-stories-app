import 'package:flutter/material.dart';

final Color appFontColor = Color.fromARGB(255, 74, 38, 2);

// Light Theme ------------------------------------
final ThemeData appLightTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFFF3EFEB),
  fontFamily: 'Cairo',
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Color.fromARGB(255, 253, 184, 81),
    circularTrackColor: Colors.grey.shade300,
  ),
  cardColor: Colors.white,
  primaryColor: Color(0xFFFBBA51),
  colorScheme: ColorScheme.light(
    secondary: Colors.orange,
    onPrimary: Color(0xFF4A2602),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: appFontColor),
    bodyLarge: TextStyle(color: appFontColor),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFF3EFEB),
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: appFontColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFFBBA51),
      foregroundColor: appFontColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.brown,
    suffixIconColor: Colors.brown,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.brown),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orange),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: Color(0xFFF3EFEB),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xFF4A2602),
    ),
    contentTextStyle: TextStyle(color: Color(0xFF4A2602)),
  ),
  iconTheme: IconThemeData(color: Color(0xFF4A2602)),
);

// --------------------- DARK THEME ---------------------
final ThemeData appDarkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFF1E1E1E),
  fontFamily: 'Cairo',
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Color.fromARGB(255, 253, 184, 81),
    circularTrackColor: Colors.grey.shade800,
  ),
  cardColor: Color(0xFF2C2C2C),
  primaryColor: Color(0xFFFFB23C),
  colorScheme: ColorScheme.dark(
    secondary: Colors.orange.shade200,
    onPrimary: Color(0xFF4A2602),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white70),
    bodyLarge: TextStyle(color: Colors.white70),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0xFFF3EFEB),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFFFB23C),
      foregroundColor: Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.orange.shade200,
    suffixIconColor: Colors.orange.shade200,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orange.shade200),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orange.shade400),
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: Color(0xFF2C2C2C),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    contentTextStyle: TextStyle(color: Colors.white70),
  ),
  iconTheme: IconThemeData(color: Color(0xFFF3EFEB)),
);
