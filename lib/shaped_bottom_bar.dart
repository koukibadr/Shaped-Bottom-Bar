library shaped_bottom_bar;

import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/models/shaped_item_object.dart';
import 'package:shaped_bottom_bar/utils/shapes.dart';
import 'package:shaped_bottom_bar/widgets/circle_shape.dart';
import 'package:shaped_bottom_bar/widgets/hexagon_shape.dart';
import 'package:shaped_bottom_bar/widgets/rotated_hexagon.dart';
import 'package:shaped_bottom_bar/widgets/royal_shape.dart';
import 'package:shaped_bottom_bar/widgets/shaped_bottom_bar_item.dart';
import 'package:shaped_bottom_bar/widgets/square.dart';
import 'package:shaped_bottom_bar/widgets/triangle_shape.dart';

const double SHAPED_BOTTOM_BAR_SIZE = 70;

class ShapedBottomBar extends StatefulWidget {
  
  final List<ShapedItemObject> listItems;
  final Function(int) onItemChanged;

  final double height;
  final double? width;

  final bool withRoundCorners;
  final BorderRadius? cornerRadius;
  final ShapeType shape;
  final int selectedItemIndex;
  
  //Colors
  final Color? shapeColor;
  final Color backgroundColor;
  final Color iconsColor;
  final Color selectedIconColor;
  final Color textColor;
  final Color bottomBarTopColor;

  ShapedBottomBar(
      {required this.onItemChanged,
      required this.listItems,
      this.height = SHAPED_BOTTOM_BAR_SIZE,
      this.width,
      this.withRoundCorners = false,
      this.cornerRadius,
      this.shape = ShapeType.NONE,
      this.selectedItemIndex = 0,
      this.shapeColor,
      this.iconsColor = Colors.black,
      this.textColor = Colors.black,
      this.selectedIconColor = Colors.white,
      this.bottomBarTopColor = Colors.white,
      this.backgroundColor = Colors.blue,}) {
    if (this.withRoundCorners) {
      assert(this.cornerRadius != null);
    }
    if (this.shape != ShapeType.NONE) {
      assert(this.shapeColor != null);
    }
    assert(this.listItems.isNotEmpty);
  }

  @override
  _ShapedBottomBarState createState() => _ShapedBottomBarState();
}

class _ShapedBottomBarState extends State<ShapedBottomBar> {
  late int selectedIndex;
  late List<Widget> bottomBarWidgets;

  @override
  void initState() {
    super.initState();
    this.selectedIndex = this.widget.selectedItemIndex;
    generateListOfWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width ?? MediaQuery.of(context).size.width,
      height: this.widget.height,
      color: this.widget.bottomBarTopColor,
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
    for (var index = 0; index < this.bottomBarWidgets.length; index++) {
      var item = this.bottomBarWidgets[index];
      if (index == selectedIndex) {
        if (bottomBarItems.isNotEmpty) {
          renderingItems.addAll(bottomBarItems);
        }
        renderingItems.add(Expanded(flex: 1, child: renderSelectedItem(item)));
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
      generateListOfWidgets();
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
        shapedWidget =
            HexagonShape(child: baseWidget, background: widget.shapeColor);
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
        shapedWidget = baseWidget;
        break;
    }
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: (this.widget.height * 0.75),
            color: widget.backgroundColor,
          ),
        ),
        shapedWidget,
      ],
    );
  }

  generateListOfWidgets() {
    bottomBarWidgets = [];
    for (ShapedItemObject object in this.widget.listItems) {
      if (this.widget.listItems.indexOf(object) == this.selectedIndex) {
        bottomBarWidgets.add(ShapedBottomBarItem(
          icon: object.iconData,
          renderWithText: false,
          themeColor: this.widget.selectedIconColor,
        ));
      } else {
        bottomBarWidgets.add(ShapedBottomBarItem(
            icon: object.iconData,
            text: object.title ?? "",
            themeColor: this.widget.iconsColor,
            renderWithText: object.title != null));
      }
    }
  }
}
