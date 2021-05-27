import 'package:flutter/material.dart';

class DrawRotatedHexagon extends CustomPainter {
  final Color? background;

  DrawRotatedHexagon(
      {this.background = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = this.background ?? Colors.black
      ..style = PaintingStyle.fill;

    Path path_0 = renderHexagon(size);
    canvas.drawPath(path_0, paint_0);
  }

  Path renderHexagon(Size size){
    final path = Path();
    path.lineTo((size.width * 0.2), size.height*0.1);
    path.lineTo((size.width * 0.8), 0);
    path.lineTo((size.width), size.height*0.5);
    path.lineTo((size.width * 0.8), size.height*0.9);
    path.lineTo((size.width * 0.2), size.height*0.9);
    path.lineTo(0, size.height*0.5);
    path.lineTo((size.width * 0.2), size.height*0.1);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
