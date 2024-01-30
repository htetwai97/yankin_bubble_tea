import 'package:flutter/material.dart';

BoxShadow buildBoxShadow() {
  return const BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 0),
    spreadRadius: 0.3,
    blurRadius: 10,
    blurStyle: BlurStyle.outer,
  );
}
