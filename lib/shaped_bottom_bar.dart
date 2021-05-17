library shaped_bottom_bar;

import 'package:flutter/material.dart';

class ShapedBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red
      ),
    );
  }
}