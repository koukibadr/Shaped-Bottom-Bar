import 'package:flutter/material.dart';

class DrawTriangleShape extends CustomPainter {
  late Paint painter;
  final Color backgroundColor;

  DrawTriangleShape({this.backgroundColor = Colors.black}) {
    painter = Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.lineTo((size.width * 0.5), 0);
    path.lineTo((size.width * 0.15), (size.height * 0.85));
    path.lineTo((size.width * 0.85), (size.height * 0.85));
    path.lineTo((size.width * 0.5), 0);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
