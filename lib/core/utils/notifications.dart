import 'package:appmatic_test_project/core/api/api.dart';
import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:flutter/material.dart';

class Notifications {
  static message(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
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

  static error(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.grey800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        icon: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.error, size: 50, color: AppColors.white),
            20.0.toVert,
            Text(
              message,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
            20.0.toVert,
            TextButton(
              style: TextButton.styleFrom(
                fixedSize: const Size(double.maxFinite, 40),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () => Api.fetchProduct(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Retry",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  10.0.toHor,
                  const Icon(Icons.refresh_rounded),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
