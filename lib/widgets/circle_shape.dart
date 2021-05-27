import 'package:flutter/material.dart';

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
