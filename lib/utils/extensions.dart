import 'package:flutter/cupertino.dart';

extension CustomPaintExtension on CustomPaint {
  CustomPaint clone({Widget? child}) {
    return CustomPaint(
      key: key,
      painter: painter,
      foregroundPainter: foregroundPainter,
      size: size,
      isComplex: isComplex,
      willChange: willChange,
      child: child,
    );
  }
}
