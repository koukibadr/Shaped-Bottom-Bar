import 'package:flutter/material.dart';

class DrawHexagon extends CustomPainter {
  final Color background;
  final bool with3DEffect;

  DrawHexagon({
    this.background = Colors.black,
    this.with3DEffect = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = background
      ..style = PaintingStyle.fill;

    Path path = renderHexagon(size);
    canvas.drawPath(path, paint);

    if (with3DEffect) {
      Paint shadowPainter = Paint()
        ..color = background.withAlpha(95)
        ..style = PaintingStyle.fill;
      Path shadowPath = _renderShadow(size);
      canvas.drawPath(shadowPath, shadowPainter);
    }
  }

  Path renderHexagon(Size size) {
    final path = Path();
    path.lineTo((size.width * 0.5), size.height * 0.1);
    path.lineTo((size.width * 0.25), (size.height * 0.3));
    path.lineTo((size.width * 0.25), (size.height * 0.7));
    path.lineTo((size.width * 0.5), size.height * 0.9);
    path.lineTo((size.width * 0.75), (size.height * 0.7));
    path.lineTo((size.width * 0.75), (size.height * 0.3));
    path.lineTo((size.width * 0.5), size.height * 0.1);
    path.close();

    return path;
  }

  Path _renderShadow(Size size) {
    var shadowPath = Path();
    shadowPath.lineTo((size.width * 0.55), size.height * 0.05);
    shadowPath.lineTo((size.width * 0.5), size.height * 0.1);
    shadowPath.lineTo((size.width * 0.75), (size.height * 0.3));
    shadowPath.lineTo((size.width * 0.75), (size.height * 0.7));
    shadowPath.lineTo((size.width * 0.8), (size.height * 0.65));
    shadowPath.lineTo((size.width * 0.8), (size.height * 0.25));
    shadowPath.lineTo((size.width * 0.55), size.height * 0.05);
    shadowPath.close();

    return shadowPath;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
