import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/paint/draw_royal_shape.dart';

class RoyalShape extends StatelessWidget {
  final double size;
  final Color? background;
  final Widget child;

  RoyalShape(
      {required this.child, this.background = Colors.white, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(this.size, this.size),
        painter: DrawRoyalShape(background: this.background),
        child: this.child,
      ),
    );
  }
}
