import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/paint/draw_pentagon.dart';

///genreates a Pentagon shape widget with the given [child] in the center of the Pentagon
///[child] is a required parameter
///
///
/// [background] : optional parameter used to change the background of the Pentagon
/// [size] : optional parameter by default it's 50
class PentagonShape extends StatelessWidget {
  final double size;
  final Color background;
  final Widget child;
  final bool with3DEffect;

  const PentagonShape({
    Key? key,
    required this.child,
    this.background = Colors.white,
    this.size = 50,
    this.with3DEffect = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: DrawPentagon(
        backgroundColor: background,
        with3DEffect: with3DEffect,
      ),
      child: child,
    );
  }
}
