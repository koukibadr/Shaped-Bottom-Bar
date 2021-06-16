import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/utils/arrays.dart';

class AnimatedShape extends StatelessWidget {
  final Widget shape;
  final ANIMATION_TYPE animationType;
  final double animationValue;
  final Animation<Offset>? animationOffset;

  AnimatedShape(
      {required this.shape,
      this.animationType = ANIMATION_TYPE.NONE,
      this.animationValue = 1,
      this.animationOffset});

  @override
  Widget build(BuildContext context) {
    return _renderAnimatedShape();
  }

  Widget _renderAnimatedShape() {
    switch (this.animationType) {
      case ANIMATION_TYPE.FADE:
        return AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: this.animationValue,
          child: this.shape,
        );
      case ANIMATION_TYPE.SLIDE_VERTICALLY:
        return SlideTransition(
          position: animationOffset!,
          child: this.shape,
        );
      default:
        return this.shape;
    }
  }
}
