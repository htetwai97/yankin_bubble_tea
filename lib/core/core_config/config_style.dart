import 'package:flutter/material.dart';

class ConfigStyle {
  static regularStyle(double? size, Color? color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: size,
    );
  }

  static boldStyle(double? size, Color? color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: size,
    );
  }
}
