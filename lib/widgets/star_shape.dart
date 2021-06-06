import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/paint/draw_star.dart';

///genreates a Star shape widget with the given [child] in the center of the Star
///[child] is a required parameter
///
///
/// [background] : optional parameter used to change the background of the Star
/// [size] : optional parameter by default it's 50
class StarShape extends StatelessWidget {
  final double size;
  final Color background;
  final Widget child;

  StarShape(
      {required this.child, this.background = Colors.white, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(this.size, this.size),
        painter: DrawStar(backgroundColor: this.background),
        child: this.child,
      ),
    );
  }
}
