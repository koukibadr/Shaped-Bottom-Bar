import 'package:flutter/material.dart';

class ShapedBottomBarItem extends StatelessWidget {
  final Color themeColor;
  final String? text;
  final IconData icon;
  final bool renderWithText;

  ShapedBottomBarItem(
      {required this.icon,
      this.text = "",
      this.themeColor = Colors.black,
      this.renderWithText = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(this.icon, color: this.themeColor),
          this.renderWithText ? Text(this.text ?? "") : Container()
        ],
      ),
    );
  }
}
