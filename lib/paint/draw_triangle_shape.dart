import 'package:flutter/material.dart';

class DrawTriangleShape extends CustomPainter {
  late Paint painter;
  final Color backgroundColor;

  final bool with3DEffect;

  DrawTriangleShape(
      {this.backgroundColor = Colors.black, this.with3DEffect = false}) {
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

    if (this.with3DEffect) {
      Paint shadowPainter = Paint()
        ..color = this.backgroundColor.withAlpha(95)
        ..style = PaintingStyle.fill;
      var shadowPath = Path();
      shadowPath.lineTo((size.width * 0.55), (size.height * 0));
      shadowPath.lineTo((size.width * 0.5), (size.height * 0.05));
      shadowPath.lineTo((size.width * 0.85), (size.height * 0.85));
      shadowPath.lineTo((size.width * 0.9), (size.height * 0.8));
      shadowPath.lineTo((size.width * 0.55), (size.height * 0));
      shadowPath.close();
      canvas.drawPath(shadowPath, shadowPainter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
