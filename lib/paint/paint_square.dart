import 'package:flutter/material.dart';

class PaintSquare extends CustomPainter {
  final Color backgroundColor;

  PaintSquare({this.backgroundColor = Colors.blue});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.0;

    Path path_0 = Path();
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
