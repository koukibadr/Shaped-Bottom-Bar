import 'package:flutter/material.dart';

///The main widget used as a child to the bottom bar,
///every item will be used as [ShapedBottomBarItem]
class ShapedBottomBarItem extends StatelessWidget {
  final Color themeColor;
  final String? text;
  final IconData icon;
  final bool renderWithText;
  final TextStyle? textStyle;

  ShapedBottomBarItem(
      {required this.icon,
      this.text = "",
      this.themeColor = Colors.black,
      this.renderWithText = true,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(this.icon, color: this.themeColor),
          this.renderWithText
              ? Text(this.text ?? "", style: this.textStyle)
              : Container()
        ],
      ),
    );
  }
}
