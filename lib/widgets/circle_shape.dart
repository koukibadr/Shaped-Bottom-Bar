import 'package:flutter/material.dart';

///genreates a circular widget with the given [child] in the center of the circle
///[child] is a required parameter
///
///
/// [background] : optional parameter used to change the background of the circle
/// [size] : optional parameter by default it's 50
class CircleShape extends StatelessWidget {
  final double size;
  final Color? background;
  final Widget child;

  CircleShape(
      {required this.child, this.background = Colors.white, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size * 0.8,
      height: this.size * 0.8,
      decoration: BoxDecoration(shape: BoxShape.circle, color: this.background),
      child: this.child,
    );
  }
}
