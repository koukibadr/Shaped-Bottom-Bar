library shaped_bottom_bar;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/models/shaped_item_object.dart';
import 'package:shaped_bottom_bar/utils/arrays.dart';
import 'package:shaped_bottom_bar/widgets/circle_shape.dart';
import 'package:shaped_bottom_bar/widgets/custom_shape_widget.dart';
import 'package:shaped_bottom_bar/widgets/diamond_shape.dart';
import 'package:shaped_bottom_bar/widgets/hexagon_shape.dart';
import 'package:shaped_bottom_bar/widgets/octagon_shape.dart';
import 'package:shaped_bottom_bar/widgets/pentagon_shape.dart';
import 'package:shaped_bottom_bar/widgets/rhombus_shape.dart';
import 'package:shaped_bottom_bar/widgets/rotated_hexagon.dart';
import 'package:shaped_bottom_bar/widgets/royal_shape.dart';
import 'package:shaped_bottom_bar/widgets/shaped_bottom_bar_item.dart';
import 'package:shaped_bottom_bar/widgets/square.dart';
import 'package:shaped_bottom_bar/widgets/star_shape.dart';
import 'package:shaped_bottom_bar/widgets/triangle_shape.dart';

import 'widgets/animated_shape.dart';

///The size of the bottom bar: default 70
const double shapedBottomBarSize = 70;

///Main widget of shaped bottom bar
///required [listItems] the list of [ShapedItemObject] that will be shown
///[onItemChanged] function that will be trigerred everytime the current item changes
///Other attributes are optional
///
///By default the bottom bar will be rendered without shape.
///to set a shape use [shape] type of [ShapeType] enum contain 6 different shapes.
class ShapedBottomBar extends StatefulWidget {
  ShapedBottomBar({
    Key? key,
    required this.onItemChanged,
    required this.listItems,
    this.height = shapedBottomBarSize,
    this.width,
    this.withRoundCorners = false,
    this.cornerRadius,
    this.shape = ShapeType.none,
    this.selectedItemIndex = 0,
    this.shapeColor = Colors.blue,
    this.iconsColor = Colors.black,
    this.textStyle = const TextStyle(color: Colors.black),
    this.selectedIconColor = Colors.white,
    this.bottomBarTopColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.customShape,
    this.animationType = ANIMATION_TYPE.none,
    this.with3dEffect = false,
  }) : super(key: key) {
    if (withRoundCorners) {
      assert(cornerRadius != null);
    }

    if (shape == ShapeType.custom) {
      assert(customShape != null);
    }

    assert(listItems.isNotEmpty);
  }

  final List<ShapedItemObject> listItems;
  final Function(int) onItemChanged;

  final double height;
  final double? width;

  final bool withRoundCorners;
  final BorderRadius? cornerRadius;
  final ShapeType shape;
  final int selectedItemIndex;

  //Colors
  final Color shapeColor;
  final Color backgroundColor;
  final Color iconsColor;
  final Color selectedIconColor;
  final TextStyle textStyle;
  final Color bottomBarTopColor;

  ///used to implement shaped bottom bar with custom shape
  ///with a given CustomPaint object and set [shape] to [ShapeType.custom]
  ///
  final CustomPaint? customShape;

  ///aimation that will be set when navigating between navigation bar items
  ///possible values
  ///```dart
  ///[
  /// NONE,
  /// FADE,
  /// SLIDE_VERTICALLY,
  /// ROTATE
  ///]
  ///```
  ///
  final ANIMATION_TYPE animationType;

  ///Whether the selected shape will be rendered with 3D effects
  ///by default it's false
  ///
  final bool with3dEffect;

  @override
  _ShapedBottomBarState createState() => _ShapedBottomBarState();
}

class _ShapedBottomBarState extends State<ShapedBottomBar>
    with TickerProviderStateMixin {
  ///Current selected item index, by default it takes the value of [this.widget.selectedItemIndex]
  ///
  late int selectedIndex;

  ///List of widgets that will be displayed in the bottom bar after adding the shape
  ///
  late List<Widget> bottomBarWidgets;

  ///Used when animation type set to [fade]
  ///
  double opacity = 1;

  ///the slide animation controller
  ///
  late AnimationController? slideController;

  ///the offset animation used for slide animation
  ///
  late Animation<Offset>? _offsetAnimation;

  ///The rotation animation controller
  ///
  late AnimationController? rotateController;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedItemIndex;

    slideController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1.5),
    ).animate(
      CurvedAnimation(
        parent: slideController!,
        curve: Curves.ease,
      ),
    );

    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );

    generateListOfWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height,
      color: widget.bottomBarTopColor,
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
    for (var index = 0; index < bottomBarWidgets.length; index++) {
      var item = bottomBarWidgets[index];
      if (index == selectedIndex) {
        if (bottomBarItems.isNotEmpty) {
          renderingItems.addAll(bottomBarItems);
        }
        renderingItems.add(
          Expanded(
            flex: 1,
            child: renderSelectedItem(item),
          ),
        );
        bottomBarItems.clear();
      } else {
        bottomBarItems.add(
          Expanded(
            flex: 1,
            child: renderClickableWidget(
              index,
              item,
            ),
          ),
        );
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
        onItemSelected(index);
      },
      child: Container(
        height: (widget.height * 0.75),
        color: widget.backgroundColor,
        child: item,
      ),
    );
  }

  ///updates the current selected item index to a new index
  ///triggered on tapping on any unselected widget, play the selected animation transition
  ///and trigger the [onItemChanged] function passed as parameter the the main widget
  ///
  ///[position]: the position of the new selected item
  ///
  /// has no return value
  void onItemSelected(int position) {
    switch (widget.animationType) {
      case ANIMATION_TYPE.fade:
        setState(() {
          opacity = 0;
        });
        Timer(
          const Duration(
            milliseconds: 200,
          ),
          () {
            widget.onItemChanged(position);
            setState(
              () {
                selectedIndex = position;
                generateListOfWidgets();
              },
            );
            Timer(
              const Duration(
                milliseconds: 200,
              ),
              () {
                setState(
                  () {
                    opacity = 1;
                  },
                );
              },
            );
          },
        );
        break;
      case ANIMATION_TYPE.slideVertically:
        slideController!.animateTo(1.5);
        Timer(
          const Duration(
            milliseconds: 200,
          ),
          () {
            widget.onItemChanged(position);
            setState(() {
              selectedIndex = position;
              generateListOfWidgets();
            });
            slideController!.animateTo(0);
          },
        );
        break;
      case ANIMATION_TYPE.rotate:
        widget.onItemChanged(position);
        setState(
          () {
            selectedIndex = position;
            generateListOfWidgets();
          },
        );
        rotateController!.forward();
        Timer(
          const Duration(milliseconds: 300),
          () {
            rotateController!.reset();
          },
        );
        break;
      default:
        setState(
          () {
            selectedIndex = position;
            generateListOfWidgets();
          },
        );
    }
  }

  ///render the selected widget
  ///based on the parameter [shape] it render the apporpriate shape
  ///if shape equals to [ShapeType.none] the selected item will be just a colored icon with the color is [selectedIconColor]
  ///
  ///the widget result will be wraped with [AnimatedShape] widget with the selected animation [widget.animationType]
  ///
  ///[baseWidget] : the selected widget that will be wrapped  with a shape.
  ///
  ///return a [Widget] type variable.
  Widget renderSelectedItem(Widget baseWidget) {
    Widget shapedWidget;
    switch (widget.shape) {
      case ShapeType.circle:
        shapedWidget = CircleShape(
          child: baseWidget,
          background: widget.shapeColor,
          size: widget.height,
        );
        break;
      case ShapeType.square:
        shapedWidget = SquareShape(
          child: baseWidget,
          background: widget.shapeColor,
          with3DEffect: widget.with3dEffect,
          size: widget.height,
        );
        break;
      case ShapeType.triange:
        shapedWidget = TriangleShape(
          child: baseWidget,
          background: widget.shapeColor,
          size: widget.height,
          render3dEffect: widget.with3dEffect,
        );
        break;
      case ShapeType.hexagone:
        shapedWidget = HexagonShape(
          child: baseWidget,
          background: widget.shapeColor,
          with3DEffect: widget.with3dEffect,
        );
        break;
      case ShapeType.rotatedHexagon:
        shapedWidget = RotatedHexagon(
          child: baseWidget,
          background: widget.shapeColor,
          size: widget.height,
          with3DEffect: widget.with3dEffect,
        );
        break;
      case ShapeType.royalShape:
        shapedWidget = RoyalShape(
          child: baseWidget,
          background: widget.shapeColor,
          size: widget.height,
        );
        break;
      case ShapeType.pentagon:
        shapedWidget = PentagonShape(
          child: baseWidget,
          background: widget.shapeColor,
          size: widget.height,
          with3DEffect: widget.with3dEffect,
        );
        break;
      case ShapeType.star:
        shapedWidget = StarShape(
          child: baseWidget,
          background: widget.shapeColor,
          size: widget.height,
        );
        break;
      case ShapeType.rhombus:
        shapedWidget = RhombusShape(
          child: baseWidget,
          background: widget.shapeColor,
          size: widget.height,
          with3DEffect: widget.with3dEffect,
        );
        break;
      case ShapeType.octagon:
        shapedWidget = OctagonShape(
          child: baseWidget,
          background: widget.shapeColor,
          size: widget.height,
          with3DEffect: widget.with3dEffect,
        );
        break;
      case ShapeType.diamond:
        shapedWidget = DiamondShape(
          child: baseWidget,
          background: widget.shapeColor,
          size: widget.height,
          with3DEffect: widget.with3dEffect,
        );
        break;
      case ShapeType.custom:
        shapedWidget = CustomShapeWidget(
          child: baseWidget,
          shape: widget.customShape!,
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
            height: (widget.height * 0.75),
            color: widget.backgroundColor,
          ),
        ),
        AnimatedShape(
          animationType: widget.animationType,
          animationValue: opacity,
          animationOffset: _offsetAnimation,
          animationController: rotateController,
          shape: shapedWidget,
        )
      ],
    );
  }

  ///Generate list of [ShapedBottomBarItem] objects, used in rendering the shaped bottom bar
  ///iterates over [this.widget.listItems] and create the apporpriate [ShapedBottomBarItem] widget
  ///
  ///this function has no parameter, and has no return value
  void generateListOfWidgets() {
    bottomBarWidgets = [];
    for (ShapedItemObject item in widget.listItems) {
      if (widget.listItems.indexOf(item) == selectedIndex) {
        bottomBarWidgets.add(
          ShapedBottomBarItem(
            icon: item.iconData,
            renderWithText: false,
            themeColor: widget.selectedIconColor,
          ),
        );
      } else {
        bottomBarWidgets.add(
          ShapedBottomBarItem(
            icon: item.iconData,
            text: item.title ?? '',
            themeColor: widget.iconsColor,
            renderWithText: item.title != null,
            textStyle: widget.textStyle,
          ),
        );
      }
    }
  }
}
