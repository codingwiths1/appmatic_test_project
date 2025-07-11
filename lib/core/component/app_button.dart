import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:flutter/material.dart';

class AppButton {
  static Widget bigButton(BuildContext context, void Function()? onPressed) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(double.infinity, 50),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        "Cashout \$1000",
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(fontSize: 16, color: AppColors.white,fontWeight: FontWeight.bold),
      ),
    );
  }
}
