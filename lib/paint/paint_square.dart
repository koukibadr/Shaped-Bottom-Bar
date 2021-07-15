import 'package:flutter/material.dart';

class PaintSquare extends CustomPainter {
  final Color backgroundColor;
  final bool with3dEffect;
  late Paint shadowPainter;

  PaintSquare({this.backgroundColor = Colors.blue, this.with3dEffect = false});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.0;

    Path path = Path();
    path.lineTo(size.width * 0.2, size.height * 0.2);
    path.lineTo(size.width * 0.8, size.height * 0.2);
    path.lineTo(size.width * 0.8, size.height * 0.8);
    path.lineTo(size.width * 0.2, size.height * 0.8);
    path.lineTo(size.width * 0.2, size.height * 0.2);
    path.close();

    canvas.drawPath(path, paint_0);
    if (this.with3dEffect) {
      shadowPainter = Paint()
        ..color = this.backgroundColor.withAlpha(90)
        ..style = PaintingStyle.fill;

      var shadowPath = Path();
      shadowPath.lineTo(size.width * 0.25, size.height * 0.15);
      shadowPath.lineTo(size.width * 0.2, size.height * 0.2);
      shadowPath.lineTo(size.width * 0.8, size.height * 0.2);
      shadowPath.lineTo(size.width * 0.8, size.height * 0.8);
      shadowPath.lineTo(size.width * 0.85, size.height * 0.75);
      shadowPath.lineTo(size.width * 0.85, size.height * 0.15);
      shadowPath.lineTo(size.width * 0.25, size.height * 0.15);
      shadowPath.close();

      canvas.drawPath(shadowPath, shadowPainter);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
