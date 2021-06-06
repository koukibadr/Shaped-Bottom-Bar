import 'package:flutter/material.dart';

class DrawDiamond extends CustomPainter {
  late Paint painter;
  final Color backgroundColor;

  DrawDiamond({this.backgroundColor = Colors.black}) {
    painter = Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.lineTo((size.width * 0.3), size.height * 0.1);
    path.lineTo((size.width * 0.7), size.height * 0.1);
    path.lineTo((size.width * 0.85), size.height * 0.35);
    path.lineTo((size.width * 0.5), size.height * 0.9);
    path.lineTo((size.width * 0.15), size.height * 0.35);
    path.lineTo((size.width * 0.3), size.height * 0.1);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
