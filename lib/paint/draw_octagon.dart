import 'package:flutter/material.dart';

class DrawOctagon extends CustomPainter {
  late Paint painter;
  final Color backgroundColor;
  final bool with3DEffect;

  DrawOctagon(
      {this.backgroundColor = Colors.black, this.with3DEffect = false}) {
    painter = Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.lineTo((size.width * 0.3), size.height * 0.1);
    path.lineTo((size.width * 0.7), size.height * 0.1);
    path.lineTo((size.width * 0.85), size.height * 0.3);
    path.lineTo((size.width * 0.85), size.height * 0.7);
    path.lineTo((size.width * 0.7), size.height * 0.9);
    path.lineTo((size.width * 0.3), size.height * 0.9);
    path.lineTo((size.width * 0.15), size.height * 0.7);
    path.lineTo((size.width * 0.15), size.height * 0.3);
    path.lineTo((size.width * 0.3), size.height * 0.1);
    path.close();

    canvas.drawPath(path, painter);

    if (this.with3DEffect) {
      Paint shadowPainter = Paint()
        ..color = this.backgroundColor.withAlpha(90)
        ..style = PaintingStyle.fill;
      var shadowPath = Path();

      shadowPath.lineTo((size.width * 0.35), size.height * 0.05);
      shadowPath.lineTo((size.width * 0.3), size.height * 0.1);
      shadowPath.lineTo((size.width * 0.7), size.height * 0.1);
      shadowPath.lineTo((size.width * 0.85), size.height * 0.3);
      shadowPath.lineTo((size.width * 0.85), size.height * 0.7);
      shadowPath.lineTo((size.width * 0.7), size.height * 0.9);
      shadowPath.lineTo((size.width * 0.75), size.height * 0.9);
      shadowPath.lineTo((size.width * 0.9), size.height * 0.7);
      shadowPath.lineTo((size.width * 0.9), size.height * 0.3);
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
