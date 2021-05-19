library shaped_bottom_bar;

import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/utils/shapes.dart';
import 'package:shaped_bottom_bar/widgets/square.dart';

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
      this.height = 50,
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
      decoration: BoxDecoration(
          color: this.widget.backgroundColor,
          borderRadius:
              this.widget.withRoundCorners ? this.widget.cornerRadius : null),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: renderBarItems(),
      ),
    );
  }

  List<Widget> renderBarItems() {
    List<Widget> bottomBarItems = [];
    for (var index = 0; index < this.widget.items.length; index++) {
      var item = this.widget.items[index];
      if (index == this.selectedIndex && this.widget.shape != ShapeType.NONE) {
        bottomBarItems.add(renderSelectedItem(item));
      } else {
        bottomBarItems.add(Expanded(
          flex: 1,
          child: renderClickableWidget(index, item),
        ));
      }
    }
    return bottomBarItems;
  }

  Widget renderClickableWidget(int index, Widget widget) {
    return InkWell(
      onTap: () {
        this.onItemSelected(index);
      },
      child: widget,
    );
  }

  void onItemSelected(int position) {
    this.widget.onItemChanged(position);
    setState(() {
      this.selectedIndex = position;
    });
  }

  Widget renderSelectedItem(Widget baseWidget) {
    return SquareShape(background: this.widget.shapeColor!, child: baseWidget,size: 70,);
  }
}
