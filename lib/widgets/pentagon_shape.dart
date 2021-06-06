import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/paint/draw_pentagon.dart';

///genreates a Hexagon shape widget with the given [child] in the center of the hexagon
///[child] is a required parameter
///
///
/// [background] : optional parameter used to change the background of the Hexagon
/// [size] : optional parameter by default it's 50
class PentagonShape extends StatelessWidget {
  final double size;
  final Color background;
  final Widget child;

  PentagonShape(
      {required this.child, this.background = Colors.white, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(this.size, this.size),
        painter: DrawPentagon(backgroundColor: this.background),
        child: this.child,
      ),
    );
  }
}