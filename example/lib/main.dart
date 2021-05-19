import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/shaped_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: ShapedBottomBar(
          backgroundColor: Colors.grey,
          items: [Container(),Container()]
        ),
        body: Container(
          width: double.infinity,
          child: Center(child: Text("Hello")),
        ),
      ),
    );
  }
}
