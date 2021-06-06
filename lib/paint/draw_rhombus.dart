import 'package:flutter/material.dart';

class DrawRhombus extends CustomPainter {
  late Paint painter;
  final Color backgroundColor;

  DrawRhombus({this.backgroundColor = Colors.black}) {
    painter = Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.lineTo((size.width * 0.5), (size.height * 0.1));
    path.lineTo((size.width * 0.2), (size.height * 0.5));
    path.lineTo((size.width * 0.5), (size.height * 0.9));
    path.lineTo((size.width * 0.8), (size.height * 0.5));
    path.lineTo((size.width * 0.5), (size.height * 0.1));
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
