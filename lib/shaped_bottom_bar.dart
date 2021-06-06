library shaped_bottom_bar;

import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/models/shaped_item_object.dart';
import 'package:shaped_bottom_bar/utils/shapes.dart';
import 'package:shaped_bottom_bar/widgets/circle_shape.dart';
import 'package:shaped_bottom_bar/widgets/custom_shape_widget.dart';
import 'package:shaped_bottom_bar/widgets/hexagon_shape.dart';
import 'package:shaped_bottom_bar/widgets/rotated_hexagon.dart';
import 'package:shaped_bottom_bar/widgets/royal_shape.dart';
import 'package:shaped_bottom_bar/widgets/shaped_bottom_bar_item.dart';
import 'package:shaped_bottom_bar/widgets/square.dart';
import 'package:shaped_bottom_bar/widgets/triangle_shape.dart';

///The size of the bottom bar: default 70
const double SHAPED_BOTTOM_BAR_SIZE = 70;

///Main widget of shaped bottom bar
///required [listItems] the list of [ShapedItemObject] that will be shown
///[onItemChanged] function that will be trigerred everytime the current item changes
///Other attributes are optional
///
///By default the bottom bar will be rendered without shape.
///to set a shape use [shape] type of [ShapeType] enum contain 6 different shapes.
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
  final TextStyle textStyle;
  final Color bottomBarTopColor;

  ///used to implement shaped bottom bar with custom shape
  ///with a given CustomPaint object and set [shape] to [ShapeType.CUSTOM]
  ///
  final CustomPaint? customShape;

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
      this.textStyle = const TextStyle(color: Colors.black),
      this.selectedIconColor = Colors.white,
      this.bottomBarTopColor = Colors.white,
      this.backgroundColor = Colors.blue,
      this.customShape}) {
    if (this.withRoundCorners) {
      assert(this.cornerRadius != null);
    }

    if (this.shape != ShapeType.NONE && this.shape != ShapeType.CUSTOM) {
      assert(this.shapeColor != null);
    }

    if (this.shape == ShapeType.CUSTOM) {
      assert(this.customShape != null);
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

  ///generates the list of widgets  that will be displayed in the bottom bar
  ///return [List<Widget>] contains oll widget (selected and unselected items)
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

  ///render a clickable widget, every unselected item will be clickable
  ///the selected item is not clickable
  ///
  ///[index]: the index of the item, will be used to update the current selected item
  ///[item]: the actual unselected widget, will be used as a child in [InkWell] widget
  ///
  ///return a clickable [Widget] with a function that updates the current selected  item
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

  ///updates the current selected item index to a new index
  ///
  ///triggered on tapping on any unselected widget,
  ///and trigger the [onItemChanged] function passed as parameter the the main widget
  ///[position]: the position of the new selected item
  ///
  /// has no return value
  void onItemSelected(int position) {
    this.widget.onItemChanged(position);
    setState(() {
      this.selectedIndex = position;
      generateListOfWidgets();
    });
  }

  ///render the selected widget
  ///based on the parameter [shape] it render the apporpriate shape
  ///if shape equals to [ShapeType.NONE] the selected item will be just a colored icon with the color is [selectedIconColor]
  ///
  ///[baseWidget] : the selected widget that will be wrapped  with a shape.
  ///
  ///return a [Widget] type variable.
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
      case ShapeType.CUSTOM:
        shapedWidget = CustomShapeWidget(
          child: baseWidget,
          shape: this.widget.customShape!,
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

  ///Generate list of [ShapedBottomBarItem] objects, used in rendering the shaped bottom bar
  ///iterates over [this.widget.listItems] and create the apporpriate [ShapedBottomBarItem] widget
  ///
  ///this function has no parameter, and has no return value
  generateListOfWidgets() {
    bottomBarWidgets = [];
    for (ShapedItemObject item in this.widget.listItems) {
      if (this.widget.listItems.indexOf(item) == this.selectedIndex) {
        bottomBarWidgets.add(ShapedBottomBarItem(
          icon: item.iconData,
          renderWithText: false,
          themeColor: this.widget.selectedIconColor,
        ));
      } else {
        bottomBarWidgets.add(ShapedBottomBarItem(
          icon: item.iconData,
          text: item.title ?? "",
          themeColor: this.widget.iconsColor,
          renderWithText: item.title != null,
          textStyle: this.widget.textStyle,
        ));
      }
    }
  }
}
