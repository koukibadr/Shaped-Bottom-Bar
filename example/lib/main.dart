import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/models/shaped_item_object.dart';
import 'package:shaped_bottom_bar/utils/arrays.dart';
import 'package:shaped_bottom_bar/shaped_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
        backgroundColor: Colors.black12,
        iconsColor: Colors.black,
        listItems: [
          ShapedItemObject(iconData: Icons.alarm, title: "Alarm"),
          ShapedItemObject(iconData: Icons.menu_book, title: "Menu"),
          ShapedItemObject(
              iconData: Icons.verified_user_rounded, title: "User"),
          ShapedItemObject(iconData: Icons.login, title: "Logout"),
        ],
        onItemChanged: (position) {
          setState(() {
            this.selectedItem = position;
          });
        },
        shape: ShapeType.hexagone,
        shapeColor: Colors.pink,
        selectedIconColor: Colors.white,
        animationType: ANIMATION_TYPE.fade,
      ),
      body: Container(
        child: Center(
          child: Text("Shaped Bottom Bar"),
        ),
      ),
    );
  }
}
