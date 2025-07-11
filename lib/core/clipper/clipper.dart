import 'dart:ui';

import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;

    path.moveTo(0, 0);
    path.lineTo(0, h);
    path.quadraticBezierTo(0, h - 30, 20, h - 30);
    path.lineTo(w - 20, h - 30);
    path.quadraticBezierTo(w, h - 30, w, h);
    path.lineTo(w, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
