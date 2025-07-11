import 'package:flutter/material.dart';

class AppColors {
  static const Color blue = Color(0xff605bff);
  static Color? backgroundColor = Colors.grey[300];
  static const Color transparent = Color(0x00000000);
  static const Color white26 = Color(0x26ffffff);
}

final lightMode = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundColor,
);
