library shaped_bottom_bar;

import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/utils/shapes.dart';
import 'package:shaped_bottom_bar/widgets/circle_shape.dart';
import 'package:shaped_bottom_bar/widgets/hexagon_shape.dart';
import 'package:shaped_bottom_bar/widgets/rotated_hexagon.dart';
import 'package:shaped_bottom_bar/widgets/royal_shape.dart';
import 'package:shaped_bottom_bar/widgets/square.dart';
import 'package:shaped_bottom_bar/widgets/triangle_shape.dart';

class ShapedBottomBar extends StatefulWidget {
  final double height;
  final Color backgroundColor;
  final bool withRoundCorners;
  final double? width;
  final BorderRadius? cornerRadius;
  final List<Widget> items;
  final ShapeType shape;
  final int selectedItemIndex;
  final Color? shapeColor;
  final Function(int) onItemChanged;

  ShapedBottomBar(
      {required this.items,
      required this.onItemChanged,
      this.height = 70,
      this.width,
      this.backgroundColor = Colors.white,
      this.withRoundCorners = false,
      this.cornerRadius,
      this.shape = ShapeType.NONE,
      this.selectedItemIndex = 0,
      this.shapeColor}) {
    if (this.withRoundCorners) {
      assert(this.cornerRadius != null);
    }
    if (this.shape != ShapeType.NONE) {
      assert(this.shapeColor != null);
    }
    assert(this.items.isNotEmpty);
  }

  @override
  _ShapedBottomBarState createState() => _ShapedBottomBarState();
}

class _ShapedBottomBarState extends State<ShapedBottomBar> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    this.selectedIndex = this.widget.selectedItemIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width ?? MediaQuery.of(context).size.width,
      height: this.widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: renderBarItems(),
      ),
    );
  }

  List<Widget> renderBarItems() {
    List<Widget> bottomBarItems = [];
    List<Widget> renderingItems = [];
    for (var index = 0; index < this.widget.items.length; index++) {
      var item = this.widget.items[index];
      if (index == selectedIndex) {
        if (bottomBarItems.isNotEmpty) {
          renderingItems.addAll(bottomBarItems);
        }
        renderingItems.add(renderSelectedItem(Expanded(flex: 1, child: item)));
        bottomBarItems.clear();
      } else {
        bottomBarItems
            .add(Expanded(flex: 1, child: renderClickableWidget(index, item)));
      }
    }
    if (bottomBarItems.isNotEmpty) {
      renderingItems.addAll(bottomBarItems);
    }
    return renderingItems;
  }

  Widget renderClickableWidget(int index, Widget item) {
    return InkWell(
      onTap: () {
        this.onItemSelected(index);
      },
      child: Container(
        height: (this.widget.height * 0.75),
        color: widget.backgroundColor,
        child: item,
      ),
    );
  }

  void onItemSelected(int position) {
    this.widget.onItemChanged(position);
    setState(() {
      this.selectedIndex = position;
    });
  }

  Widget renderSelectedItem(Widget baseWidget) {
    Widget shapedWidget;
    switch (widget.shape) {
      case ShapeType.CIRCLE:
        shapedWidget = CircleShape(
            child: baseWidget,
            background: widget.shapeColor,
            size: this.widget.height);
        break;
      case ShapeType.SQUARE:
        shapedWidget = SquareShape(
            child: baseWidget,
            background: widget.shapeColor,
            size: this.widget.height);
        break;
      case ShapeType.TRIANGLE:
        shapedWidget = TriangleShape(
          child: baseWidget,
          background: widget.shapeColor,
          size: this.widget.height,
        );
        break;
      case ShapeType.HEXAGONE:
        shapedWidget = HexagonShape(
          child: baseWidget,
          background: widget.shapeColor,
          size: this.widget.height,
        );
        break;
      case ShapeType.ROTATED_HEXAGON:
        shapedWidget = RotatedHexagon(
          child: baseWidget,
          background: widget.shapeColor,
          size: this.widget.height,
        );
        break;
      case ShapeType.ROYAL_SHAPE:
        shapedWidget = RoyalShape(
          child: baseWidget,
          background: widget.shapeColor,
          size: this.widget.height,
        );
        break;
      default:
        shapedWidget = Container();
        break;
    }
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: this.widget.height,
            height: (this.widget.height * 0.75),
            color: widget.backgroundColor,
          ),
        ),
        shapedWidget,
      ],
    );
  }
}
