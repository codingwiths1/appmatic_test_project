import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:flutter/material.dart';

class AppButton {
  static Widget bigButton(BuildContext context,
      { void Function()? onPressed,  required Widget child}) {
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
      child: child
    );
  }

  static Widget circularButton(BuildContext context,
      {void Function()? onPressed, required Widget child}) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(20, 20),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: AppColors.blue,
        shape: const CircleBorder()
      ),
      onPressed: onPressed,
      child: child
    );
  }

}


