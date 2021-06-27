import 'package:flutter/material.dart';

class Draw3DTriangleShape extends CustomPainter {
  late Paint painter;
  late Paint shadowPainter;
  final Color backgroundColor;

  Draw3DTriangleShape({this.backgroundColor = Colors.black}) {
    painter = Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.fill;
    shadowPainter = Paint()
      ..color = this.backgroundColor.withAlpha(95)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.lineTo((size.width * 0.5), (size.height * 0.05));
    path.lineTo((size.width * 0.15), (size.height * 0.85));
    path.lineTo((size.width * 0.85), (size.height * 0.85));
    path.lineTo((size.width * 0.5), (size.height * 0.05));
    path.close();

    var shadowPath = Path();
    shadowPath.lineTo((size.width * 0.55),  (size.height * 0));
    shadowPath.lineTo((size.width * 0.5), (size.height * 0.05));
    shadowPath.lineTo((size.width * 0.85), (size.height * 0.85));
    shadowPath.lineTo((size.width * 0.9), (size.height * 0.8));
    shadowPath.lineTo((size.width * 0.55),  (size.height * 0));
    shadowPath.close();

    canvas.drawPath(path, painter);
    canvas.drawPath(shadowPath, shadowPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
