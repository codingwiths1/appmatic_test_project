import 'package:flutter/material.dart';

class AppColors {
  static const Color blue = Color(0xff605bff);
  static Color? backgroundColor = Colors.grey[300];
  static const Color transparent = Color(0x00000000);
  static const Color white26 = Color(0x26ffffff);
  static const Color white = Color(0xffffffff);
}

final lightMode = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(),
  fontFamily: "SF-Pro-Rounded",
  scaffoldBackgroundColor: AppColors.backgroundColor,
);
