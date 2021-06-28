import 'package:flutter/material.dart';

class DrawRhombus extends CustomPainter {
  late Paint painter;
  final Color backgroundColor;
  final bool with3DEffect;

  DrawRhombus(
      {this.backgroundColor = Colors.black, this.with3DEffect = false}) {
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

    if (this.with3DEffect) {
      Paint shadowPainter = Paint()
        ..color = this.backgroundColor.withAlpha(90)
        ..style = PaintingStyle.fill;
      var shadowPath = Path();
      shadowPath.lineTo((size.width * 0.55), (size.height * 0.05));
      shadowPath.lineTo((size.width * 0.5), (size.height * 0.1));
      shadowPath.lineTo((size.width * 0.8), (size.height * 0.5));
      shadowPath.lineTo((size.width * 0.5), (size.height * 0.9));
      shadowPath.lineTo((size.width * 0.55), (size.height * 0.85));
      shadowPath.lineTo((size.width * 0.85), (size.height * 0.45));
      shadowPath.lineTo((size.width * 0.55), (size.height * 0.05));
      shadowPath.close();

      canvas.drawPath(shadowPath, shadowPainter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
