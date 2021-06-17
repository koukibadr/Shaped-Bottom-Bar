import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotationExample extends StatefulWidget {
  @override
  _RotationExampleState createState() => _RotationExampleState();
}

class _RotationExampleState extends State<RotationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: FlutterLogo(size: 200),
            ),
            ElevatedButton(onPressed: () {
              _controller.forward();
            }, child: Text("Rotate"))
          ],
        ),
      ),
    );
  }
}
