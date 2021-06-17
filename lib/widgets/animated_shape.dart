import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/utils/arrays.dart';
import 'dart:math' as math;

class AnimatedShape extends StatelessWidget {
  final Widget shape;
  final ANIMATION_TYPE animationType;
  final double animationValue;
  final Animation<Offset>? animationOffset;
  final AnimationController? animationController;

  AnimatedShape(
      {required this.shape,
      this.animationType = ANIMATION_TYPE.NONE,
      this.animationValue = 1,
      this.animationOffset,
      this.animationController}) {
    if (this.animationType == ANIMATION_TYPE.SLIDE_VERTICALLY) {
      assert(this.animationOffset != null);
    } else if (this.animationType == ANIMATION_TYPE.ROTATE) {
      assert(this.animationController != null);
    }
  }

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
      case ANIMATION_TYPE.ROTATE:
        return AnimatedBuilder(
          animation: animationController!,
          builder: (_, child) {
            return Transform.rotate(
              angle: animationController!.value * 2 * math.pi,
              child: child,
            );
          },
          child: this.shape,
        );
      default:
        return this.shape;
    }
  }
}
