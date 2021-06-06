import 'package:example/my_shape.dart';
import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/models/shaped_item_object.dart';
import 'package:shaped_bottom_bar/utils/shapes.dart';
import 'package:shaped_bottom_bar/shaped_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  List<Widget> screens = [
    Container(color: Colors.white),
    Container(color: Colors.white),
    Container(color: Colors.white),
    Container(color: Colors.white)
  ];

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ShapedBottomBar(
          backgroundColor: Colors.blue[50],
          iconsColor: Color(0xFF020750),
          listItems: [
            ShapedItemObject(iconData: Icons.settings, title: "Settings"),
            ShapedItemObject(
                iconData: Icons.account_balance_outlined, title: "Account"),
            ShapedItemObject(
                iconData: Icons.verified_user_rounded, title: "User"),
            ShapedItemObject(iconData: Icons.login, title: "Logout"),
          ],
          onItemChanged: (position) {
            setState(() {
              this.selectedItem = position;
            });
          },
          textStyle: TextStyle(
            color: Colors.red,
            fontSize: 15
          ),
          shape: ShapeType.DIAMOND,
          shapeColor: Colors.red),
      body: Container(),
    );
  }
}
