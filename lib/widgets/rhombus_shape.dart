import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/paint/draw_rhombus.dart';

///genreates a Rhombus shape widget with the given [child] in the center of the Rhombus
///[child] is a required parameter
///
///
/// [background] : optional parameter used to change the background of the Rhombus
/// [size] : optional parameter by default it's 50
class RhombusShape extends StatelessWidget {
  final double size;
  final Color background;
  final Widget child;
  final bool with3DEffect;

  RhombusShape(
      {required this.child,
      this.background = Colors.white,
      this.size = 50,
      this.with3DEffect = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(this.size, this.size),
        painter: DrawRhombus(backgroundColor: this.background, with3DEffect: this.with3DEffect),
        child: this.child,
      ),
    );
  }
}
