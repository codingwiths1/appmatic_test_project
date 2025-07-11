import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:appmatic_test_project/features/home/presentation/home_page.dart';
import 'package:appmatic_test_project/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
