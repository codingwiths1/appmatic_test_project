import 'package:appmatic_test_project/core/clipper/clipper.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:flutter/material.dart';

class ClipperContainer extends StatelessWidget {
  const ClipperContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: Clipper(),
          child: Container(
            color: AppColors.blue,
            height: 230,
            width: double.infinity,
          ),
        ),
        const Positioned(
          right: -50,
          top: -30,
          child: Icon(Icons.circle, size: 200, color: AppColors.white26),
        ),
        const Positioned(
          right: -50,
          bottom: -30,
          child: Icon(Icons.circle, size: 150, color: AppColors.white26),
        ),
        child
      ],
    );
  }
}
