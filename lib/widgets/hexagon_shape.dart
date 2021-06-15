import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/paint/draw_hexagon.dart';
import 'package:shaped_bottom_bar/utils/arrays.dart';
import 'package:shaped_bottom_bar/widgets/animated_shape.dart';

///genreates a Hexagon shape widget with the given [child] in the center of the hexagon
///[child] is a required parameter
///
///
/// [background] : optional parameter used to change the background of the Hexagon
/// [size] : optional parameter by default it's 50
class HexagonShape extends StatelessWidget {
  final double size;
  final Color? background;
  final Widget child;
  final ANIMATION_TYPE animationType;
  final double animationValue;

  HexagonShape(
      {required this.child,
      this.background = Colors.white,
      this.size = 50,
      this.animationType = ANIMATION_TYPE.NONE,
      this.animationValue = 1});

  @override
  Widget build(BuildContext context) {
    return renderShape();
  }

  Widget renderShape() {
    return Stack(
      children: [
        AnimatedShape(
          animationType: this.animationType,
          animationValue: this.animationValue,
          shape: CustomPaint(
            size: Size(100, 100),
            painter: DrawHexagon(background: this.background),
          ),
        ),
        this.child,
      ],
    );
  }
}
