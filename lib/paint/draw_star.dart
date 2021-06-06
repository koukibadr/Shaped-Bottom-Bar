import 'package:flutter/material.dart';

class DrawStar extends CustomPainter {
  late Paint painter;
  final Color backgroundColor;

  DrawStar({this.backgroundColor = Colors.black}) {
    painter = Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.lineTo((size.width * 0.5), 0);
    path.lineTo((size.width * 0.4), (size.height * 0.3));
    path.lineTo((size.width * 0.25), (size.height * 0.3));
    path.lineTo((size.width * 0.35), (size.height * 0.55));
    path.lineTo((size.width * 0.25), (size.height * 0.85));
    path.lineTo((size.width * 0.5), (size.height * 0.7));
    path.lineTo((size.width * 0.75), (size.height * 0.85));
    path.lineTo((size.width * 0.65), (size.height * 0.55));
    path.lineTo((size.width * 0.75), (size.height * 0.3));
    path.lineTo((size.width * 0.6), (size.height * 0.3));
    path.lineTo((size.width * 0.5), 0);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
