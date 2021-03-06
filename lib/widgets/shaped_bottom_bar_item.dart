import 'package:flutter/material.dart';

///The main widget used as a child to the bottom bar,
///every item will be used as [ShapedBottomBarItem]
class ShapedBottomBarItem extends StatelessWidget {
  final Color themeColor;
  final String? text;
  final IconData icon;
  final bool renderWithText;
  final TextStyle? textStyle;

  const ShapedBottomBarItem({
    Key? key,
    required this.icon,
    this.text = '',
    this.themeColor = Colors.black,
    this.renderWithText = true,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: themeColor),
        renderWithText ? Text(text ?? '', style: textStyle) : Container()
      ],
    );
  }
}
