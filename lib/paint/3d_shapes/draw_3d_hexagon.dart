import 'package:flutter/material.dart';

class Draw3DHexagonShape extends CustomPainter {
  late Paint painter;
  late Paint shadowPainter;
  final Color backgroundColor;

  Draw3DHexagonShape({this.backgroundColor = Colors.black}) {
    painter = Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.fill;
    shadowPainter = Paint()
      ..color = this.backgroundColor.withAlpha(95)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.lineTo((size.width * 0.5), size.height * 0.1);
    path.lineTo((size.width * 0.25), (size.height * 0.3));
    path.lineTo((size.width * 0.25), (size.height * 0.7));
    path.lineTo((size.width * 0.5), size.height * 0.9);
    path.lineTo((size.width * 0.75), (size.height * 0.7));
    path.lineTo((size.width * 0.75), (size.height * 0.3));
    path.lineTo((size.width * 0.5), size.height * 0.1);
    path.close();

    var shadowPath = Path();
    shadowPath.lineTo((size.width * 0.55), size.height * 0.05);
    shadowPath.lineTo((size.width * 0.5), size.height * 0.1);
    shadowPath.lineTo((size.width * 0.75), (size.height * 0.3));
    shadowPath.lineTo((size.width * 0.75), (size.height * 0.7));
    shadowPath.lineTo((size.width * 0.8), (size.height * 0.65));
    shadowPath.lineTo((size.width * 0.8), (size.height * 0.25));
    shadowPath.lineTo((size.width * 0.55), size.height * 0.05);
    shadowPath.close();

    canvas.drawPath(path, painter);
    canvas.drawPath(shadowPath, shadowPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
