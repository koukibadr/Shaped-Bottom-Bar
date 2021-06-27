import 'package:flutter/material.dart';

class Draw3DRotatedHexagon extends CustomPainter {
  final Color background;

  Draw3DRotatedHexagon({this.background = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = this.background
      ..style = PaintingStyle.fill;

    Paint paintShadow = new Paint()
      ..color = this.background.withAlpha(90)
      ..style = PaintingStyle.fill;

    Path path = renderHexagon(size);
    Path pathShape = renderHexagonShadow(size);
    canvas.drawPath(path, paint);
    canvas.drawPath(pathShape, paintShadow);
  }

  Path renderHexagon(Size size) {
    final path = Path();
    path.lineTo((size.width * 0.3), size.height * 0.1);
    path.lineTo((size.width * 0.7), size.height * 0.1);
    path.lineTo((size.width * 0.85), size.height * 0.5);
    path.lineTo((size.width * 0.7), size.height * 0.9);
    path.lineTo((size.width * 0.3), size.height * 0.9);
    path.lineTo((size.width * 0.15), size.height * 0.5);
    path.lineTo((size.width * 0.3), size.height * 0.1);
    path.close();
    return path;
  }

  Path renderHexagonShadow(Size size) {
    final path = Path();

    path.lineTo((size.width * 0.35), size.height * 0.05);
    path.lineTo((size.width * 0.3), size.height * 0.1);
    path.lineTo((size.width * 0.7), size.height * 0.1);
    path.lineTo((size.width * 0.85), size.height * 0.5);
    path.lineTo((size.width * 0.7), size.height * 0.9);
    path.lineTo((size.width * 0.77), size.height * 0.85);
    path.lineTo((size.width * 0.9), size.height * 0.45);
    path.lineTo((size.width * 0.75), size.height * 0.05);
    path.lineTo((size.width * 0.35), size.height * 0.05);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
