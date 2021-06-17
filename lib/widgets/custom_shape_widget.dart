import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/utils/extensions.dart';

///Creates a custom shape by a given [CustomPaint] object and set a child to it
///
class CustomShapeWidget extends StatelessWidget {
  final Widget child;
  final CustomPaint shape;

  CustomShapeWidget({required this.child, required this.shape});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.shape.clone(child: this.child),
    );
  }
}
