import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/paint/draw_hexagon.dart';
import 'package:shaped_bottom_bar/utils/arrays.dart';

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
  final double opacity;

  HexagonShape(
      {required this.child,
      this.opacity = 1,
      this.background = Colors.white,
      this.size = 50,
      this.animationType = ANIMATION_TYPE.NONE});

  @override
  Widget build(BuildContext context) {
    return _renderAnimatedShape();
  }

  Widget _renderAnimatedShape() {
    switch (this.animationType) {
      case ANIMATION_TYPE.FADE:
        return AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: this.opacity,
          child: Container(
            child: _renderShape(),
          ),
        );
      default:
        return _renderShape();
    }
  }

  CustomPaint _renderShape() {
    return CustomPaint(
      size: Size(this.size, this.size),
      painter: DrawHexagon(background: this.background),
      child: this.child,
    );
  }
}
