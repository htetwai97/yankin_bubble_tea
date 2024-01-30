// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    const double dotSpacing =
        4; // Adjust this value to control the spacing between dots
    const double dotSize = 2; // Adjust this value to control the size of dots
    for (double i = 0; i < size.height; i += dotSpacing + dotSize) {
      path.moveTo(0, i);
      path.lineTo(0, i + dotSize);
    }

    //canvas.drawLine(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DottedBorder extends StatelessWidget {
  Widget child;

  DottedBorder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
      child: CustomPaint(
        painter: DottedBorderPainter(),
        child: child,
      ),
    );
  }
}
