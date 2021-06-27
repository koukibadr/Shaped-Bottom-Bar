import 'package:flutter/material.dart';

class Draw3DPentagon extends CustomPainter {
  late Paint painter;
  late Paint painterShadow;
  final Color backgroundColor;

  Draw3DPentagon({this.backgroundColor = Colors.black}) {
    painter = Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.fill;
    painterShadow = Paint()
      ..color = this.backgroundColor.withAlpha(90)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.lineTo((size.width * 0.5), (size.height * 0.05));
    path.lineTo((size.width * 0.15), (size.height * 0.3));
    path.lineTo((size.width * 0.3), (size.height * 0.9));
    path.lineTo((size.width * 0.7), (size.height * 0.9));
    path.lineTo((size.width * 0.85), (size.height * 0.3));
    path.lineTo((size.width * 0.5), (size.height * 0.05));
    path.close();

    var pathShadow = Path()
    ..lineTo((size.width * 0.55), (size.height * 0))
    ..lineTo((size.width * 0.5), (size.height * 0.05))
    ..lineTo((size.width * 0.85), (size.height * 0.3))
    ..lineTo((size.width * 0.7), (size.height * 0.9))
    ..lineTo((size.width * 0.75), (size.height * 0.85))
    ..lineTo((size.width * 0.9), (size.height * 0.25))
    ..lineTo((size.width * 0.55), (size.height * 0))
    ..close();

    canvas.drawPath(path, painter);
    canvas.drawPath(pathShadow, painterShadow);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
