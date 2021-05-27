import 'package:flutter/material.dart';
import 'package:shaped_bottom_bar/models/shaped_item_object.dart';
import 'package:shaped_bottom_bar/utils/shapes.dart';
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
          backgroundColor: Colors.blueGrey,
          listItems: [
            ShapedItemObject(iconData: Icons.settings,title: "Settings"),
            ShapedItemObject(iconData: Icons.account_balance_outlined,title: "Account"),
            ShapedItemObject(iconData: Icons.verified_user_rounded,title: "User"),
            ShapedItemObject(iconData: Icons.login,title: "Logout"),
          ],
          onItemChanged: (position) => {},
          shapeColor: Colors.blue,
          selectedIconColor: Colors.white,
          shape: ShapeType.TRIANGLE
        ),
        body: Container(
          child: Center(),
        ),
      ),
    );
  }
}
