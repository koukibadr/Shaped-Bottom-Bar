import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/paint/draw_octagon.dart';

///genreates a Octagon shape widget with the given [child] in the center of the Octagon
///[child] is a required parameter
///
///
/// [background] : optional parameter used to change the background of the Octagon
/// [size] : optional parameter by default it's 50
class OctagonShape extends StatelessWidget {
  final double size;
  final Color background;
  final Widget child;

  OctagonShape({
    required this.child,
    this.background = Colors.white,
    this.size = 50
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(this.size, this.size),
        painter: DrawOctagon(backgroundColor: this.background),
        child: this.child,
      ),
    );
  }
}
