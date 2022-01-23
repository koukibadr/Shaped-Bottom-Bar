import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/utils/arrays.dart';
import 'dart:math' as math;

/// Render an animated widget based on the animation type given and with
/// a given child widget
///
class AnimatedShape extends StatelessWidget {
  AnimatedShape({
    Key? key,
    required this.shape,
    this.animationType = ANIMATION_TYPE.none,
    this.animationValue = 1,
    this.animationOffset,
    this.animationController,
  }) : super(key: key) {
    if (animationType == ANIMATION_TYPE.slideVertically) {
      assert(animationOffset != null);
    } else if (animationType == ANIMATION_TYPE.rotate) {
      assert(animationController != null);
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

  ///Animation value used as an opacity if the animation is [ANIMATION_TYPE.fade]
  ///
  final double animationValue;

  ///Animation offset used if the [animationType] equal [ANIMATION_TYPE.slideVertically]
  ///
  final Animation<Offset>? animationOffset;

  ///Animation controller used if the [animationType] equal [ANIMATION_TYPE.rotate]
  ///
  final AnimationController? animationController;

  @override
  Widget build(BuildContext context) {
    return _renderAnimatedShape();
  }

  Widget _renderAnimatedShape() {
    switch (animationType) {
      case ANIMATION_TYPE.fade:
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: animationValue,
          child: shape,
        );
      case ANIMATION_TYPE.slideVertically:
        return SlideTransition(
          position: animationOffset!,
          child: shape,
        );
      case ANIMATION_TYPE.rotate:
        return AnimatedBuilder(
          animation: animationController!,
          builder: (_, child) {
            return Transform.rotate(
              angle: animationController!.value * 2 * math.pi,
              child: child,
            );
          },
          child: shape,
        );
      default:
        return shape;
    }
  }
}
