import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/paint/draw_royal_shape.dart';

///genreates a Royal shape widget with the given [child] in the center of the Royal shape
///[child] is a required parameter
///
///
/// [background] : optional parameter used to change the background of the Royal shape
/// [size] : optional parameter by default it's 50
class RoyalShape extends StatelessWidget {
  final double size;
  final Color? background;
  final Widget child;

  const RoyalShape({
    Key? key,
    required this.child,
    this.background = Colors.white,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: DrawRoyalShape(background: background),
      child: child,
    );
  }
}
