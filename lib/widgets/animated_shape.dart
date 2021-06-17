import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/utils/arrays.dart';
import 'dart:math' as math;

/// Render an animated widget based on the animation type given and with
/// a given child widget
///
class AnimatedShape extends StatelessWidget {
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

  ///the shape child that will be wraped with the animated widget
  ///
  final Widget shape;

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

  ///Animation value used as an opacity if the animation is [ANIMATION_TYPE.FADE]
  ///
  final double animationValue;

  ///Animation offset used if the [animationType] equal [ANIMATION_TYPE.SLIDE_VERTICALLY]
  ///
  final Animation<Offset>? animationOffset;

  ///Animation controller used if the [animationType] equal [ANIMATION_TYPE.ROTATE]
  ///
  final AnimationController? animationController;

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
