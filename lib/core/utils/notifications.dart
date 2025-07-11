import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:flutter/material.dart';

class Notifications {
  static message(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.all(16),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: AppColors.grey800,
        content: Text(
          message,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
