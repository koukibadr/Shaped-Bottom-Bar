import 'package:flutter/cupertino.dart';

extension CustomPaintExtension on CustomPaint {
  CustomPaint clone({Widget? child}) {
    return CustomPaint(
        key: this.key,
        painter: this.painter,
        foregroundPainter: this.foregroundPainter,
        size: this.size,
        isComplex: this.isComplex,
        willChange: this.willChange,
        child: child);
  }
}
