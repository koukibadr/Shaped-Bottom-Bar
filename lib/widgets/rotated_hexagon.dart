import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/paint/3d_shapes/draw_3d_rotated_hexagon.dart';
import 'package:shaped_bottom_bar/paint/draw_hexagon_rotated.dart';

///genreates a Hexagon shape widget with the given [child] in the center of the hexagon
///[child] is a required parameter
///
///
/// [background] : optional parameter used to change the background of the Hexagon
/// [size] : optional parameter by default it's 50
class RotatedHexagon extends StatelessWidget {
  final double size;
  final Color? background;
  final Widget child;
  final bool with3DEffect;

  RotatedHexagon(
      {required this.child,
      this.background = Colors.white,
      this.size = 50,
      this.with3DEffect = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(this.size, this.size),
        painter: this.with3DEffect
            ? Draw3DRotatedHexagon(background: this.background!)
            : DrawRotatedHexagon(background: this.background),
        child: this.child,
      ),
    );
  }
}
