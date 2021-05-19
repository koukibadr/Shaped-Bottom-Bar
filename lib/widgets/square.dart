import 'package:flutter/material.dart';

class SquareShape extends StatelessWidget {
  final double size;
  final Color background;
  final Widget child;

  SquareShape(
      {required this.background, required this.child, this.size = 1000});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black,
      shadowColor: Colors.black,
      elevation: 2.5,
      child: Container(
        width: this.size,
        height: this.size,
        color: this.background,
        child: Center(child: this.child),
      ),
    );
  }
}
