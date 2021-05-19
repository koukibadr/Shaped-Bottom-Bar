library shaped_bottom_bar;

import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/utils/shapes.dart';

class ShapedBottomBar extends StatefulWidget {
  final double height;
  final Color backgroundColor;
  final bool withRoundCorners;
  final double? width;
  final BorderRadius? cornerRadius;
  final List<Widget> items;
  final ShapeType shape;

  ShapedBottomBar(
      {required this.items,
      this.height = 50,
      this.width,
      this.backgroundColor = Colors.white,
      this.withRoundCorners = false,
      this.cornerRadius,
      this.shape = ShapeType.NONE}) {
    if (this.withRoundCorners) {
      assert(this.cornerRadius != null);
    }
  }

  @override
  _ShapedBottomBarState createState() => _ShapedBottomBarState();
}

class _ShapedBottomBarState extends State<ShapedBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width ?? MediaQuery.of(context).size.width,
      height: this.widget.height,
      decoration: BoxDecoration(
          color: this.widget.backgroundColor,
          borderRadius:
              this.widget.withRoundCorners ? this.widget.cornerRadius : null),
    );
  }
}
