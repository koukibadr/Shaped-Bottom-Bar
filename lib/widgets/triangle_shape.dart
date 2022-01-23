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
  final bool render3dEffect;

  const TriangleShape({
    Key? key,
    required this.child,
    this.background = Colors.white,
    this.size = 50,
    this.render3dEffect = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: DrawTriangleShape(
        backgroundColor: background!,
        with3DEffect: render3dEffect,
      ),
      child: child,
    );
  }
}
