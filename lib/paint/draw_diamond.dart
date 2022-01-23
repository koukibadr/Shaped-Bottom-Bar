import 'package:flutter/material.dart';

class DrawDiamond extends CustomPainter {
  late Paint painter;
  late Paint shadowPainter;
  final Color backgroundColor;

  final bool with3dEffect;

  DrawDiamond({
    this.backgroundColor = Colors.black,
    this.with3dEffect = false,
  }) {
    painter = Paint()
      ..color = backgroundColor
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

    if (with3dEffect) {
      shadowPainter = Paint()
        ..color = backgroundColor.withAlpha(90)
        ..style = PaintingStyle.fill;

      var shadowPath = Path();
      shadowPath.lineTo((size.width * 0.35), size.height * 0.05);
      shadowPath.lineTo((size.width * 0.3), size.height * 0.1);
      shadowPath.lineTo((size.width * 0.7), size.height * 0.1);
      shadowPath.lineTo((size.width * 0.85), size.height * 0.35);
      shadowPath.lineTo((size.width * 0.5), size.height * 0.9);
      shadowPath.lineTo((size.width * 0.55), size.height * 0.85);
      shadowPath.lineTo((size.width * 0.9), size.height * 0.30);
      shadowPath.lineTo((size.width * 0.75), size.height * 0.05);
      shadowPath.lineTo((size.width * 0.35), size.height * 0.05);
      shadowPath.close();

      canvas.drawPath(shadowPath, shadowPainter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
