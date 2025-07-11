import 'package:flutter/material.dart';

extension NumExtension on double {
  SizedBox get toVert => SizedBox(height: this);
  SizedBox get toHor => SizedBox(width: this);
}
