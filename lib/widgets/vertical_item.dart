import 'package:flutter/material.dart';

class VerticalItem extends StatelessWidget {
  final Color themeColor;
  final String text;
  final IconData icon;
  final bool renderWithText;

  VerticalItem(
      {required this.icon,
      required this.text,
      this.themeColor = Colors.black,
      this.renderWithText = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(this.icon,color: this.themeColor),
          this.renderWithText ? Text("Example"): Container()
        ],
      ),
    );
  }
}
