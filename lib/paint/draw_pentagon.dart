import 'package:flutter/material.dart';

class DrawPentagon extends CustomPainter {
  late Paint painter;
  final Color backgroundColor;
  final bool with3DEffect;

  DrawPentagon({
    this.backgroundColor = Colors.black,
    this.with3DEffect = false,
  }) {
    painter = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.lineTo((size.width * 0.5), 0);
    path.lineTo((size.width * 0.15), (size.height * 0.3));
    path.lineTo((size.width * 0.3), (size.height * 0.9));
    path.lineTo((size.width * 0.7), (size.height * 0.9));
    path.lineTo((size.width * 0.85), (size.height * 0.3));
    path.lineTo((size.width * 0.5), 0);
    path.close();

    canvas.drawPath(path, painter);

    if (with3DEffect) {
      Paint painterShadow = Paint()
        ..color = backgroundColor.withAlpha(90)
        ..style = PaintingStyle.fill;
      var pathShadow = Path()
        ..lineTo((size.width * 0.55), (size.height * 0))
        ..lineTo((size.width * 0.5), (size.height * 0.05))
        ..lineTo((size.width * 0.85), (size.height * 0.3))
        ..lineTo((size.width * 0.7), (size.height * 0.9))
        ..lineTo((size.width * 0.75), (size.height * 0.85))
        ..lineTo((size.width * 0.9), (size.height * 0.25))
        ..lineTo((size.width * 0.55), (size.height * 0))
        ..close();

      canvas.drawPath(pathShadow, painterShadow);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
