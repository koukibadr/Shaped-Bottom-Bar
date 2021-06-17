import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/paint/draw_triangle_shape.dart';

///genreates a triangle shape widget with the given [child] in the center of the triangle
///[child] is a required parameter
///
///
/// [background] : optional parameter used to change the background of the triangle
/// [size] : optional parameter by default it's 50
class TriangleShape extends StatelessWidget {
  final double size;
  final Color? background;
  final Widget child;

  TriangleShape(
      {required this.child, this.background = Colors.white, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(this.size, this.size),
        painter: DrawTriangleShape(backgroundColor: this.background!),
        child: this.child,
      ),
    );
  }
}
