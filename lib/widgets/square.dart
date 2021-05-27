import 'package:flutter/material.dart';

class SquareShape extends StatelessWidget {
  final double size;
  final Color? background;
  final Widget child;

  SquareShape(
      {this.background = Colors.black, required this.child, this.size = 1000});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black,
      shadowColor: Colors.black,
      elevation: 2.5,
      child: Container(
        width: this.size * 0.8,
        height: this.size * 0.8,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: this.background,
        ),
        child: Center(child: this.child),
      ),
    );
  }
}
