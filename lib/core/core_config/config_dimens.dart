import 'package:flutter/material.dart';

const FONT_SMALL = 8.0;
const FONT_MEDIUM = 14.0;
const FONT_LARGE = 20.0;
const FONT_XLARGE = 26.0;

double scaleWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double scaleHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
