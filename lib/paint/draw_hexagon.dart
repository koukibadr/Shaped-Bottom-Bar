import 'package:flutter/material.dart';
import 'dart:math';

class DrawHexagon extends CustomPainter {
  static const int SIDES_OF_HEXAGON = 6;
  final double radius;
  final Offset center;
  final Color background;

  DrawHexagon(
      {required this.radius,
      required this.center,
      this.background = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = this.background
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    Path path_0 = createHexagonPath();
    canvas.drawPath(path_0, paint_0);
  }

  Path createHexagonPath() {
    final path = Path();
    var angle = (pi * 2) / SIDES_OF_HEXAGON;
    Offset firstPoint = Offset(radius * cos(0.0), radius * sin(0.0));
    path.moveTo(firstPoint.dx + center.dx, firstPoint.dy + center.dy);
    for (int i = 1; i <= SIDES_OF_HEXAGON; i++) {
      double x = radius * cos(angle * i) + center.dx;
      double y = radius * sin(angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
