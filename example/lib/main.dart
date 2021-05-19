import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/shaped_bottom_bar.dart';
import 'package:shaped_bottom_bar/utils/shapes.dart';
import 'package:shaped_bottom_bar/widgets/square.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(Icons.data_usage_rounded), Text("Example")],
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home: Scaffold(
        bottomNavigationBar: ShapedBottomBar(
          items: [column,column,column,column],
          onItemChanged: (position){

          },
          backgroundColor: Color(0xffefefef),
          shape: ShapeType.SQUARE,
          shapeColor: Colors.blue,
        ),
        body: Container(
          child: Center(child: SquareShape(background: Colors.black, child: Container(),size: 100,)),
        ),
      ),
    );
  }
}
