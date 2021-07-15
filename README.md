
  

  

#  shaped bottom bar

  

  

A new bottom bar in Flutter! a shaped bottom bar.

<b>Choose your shape and your animation and let us do the work.<b>

  

| ![enter image description here](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/example/shaped_bottom_bar_hexagon.gif?raw=true) | ![Slide_transition_example.gif](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/example/Slide_transition_example.gif?raw=true) |
|--|--|
| ![fade_transition_example.gif](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/example/fade_transition_example.gif?raw=true) | ![rotated_transition_example.gif](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/example/rotated_transition_example.gif?raw=true) |

| ![enter image description here](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/circle_shape_example.png?raw=true) | ![enter image description here](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/diamond_shape_example.png?raw=true) | ![enter image description here](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/pentagon_shape_example.png?raw=true) | ![enter image description here](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/hexagon_shape_example.png?raw=true) |
|--|--|--|--|
| ![enter image description here](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/rhombus_shape_example.png?raw=true) | ![enter image description here](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/square_shape_example.png?raw=true) | ![--](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/star_shape_example.png?raw=true) | ![--](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/triangle_shape_example.png?raw=true) |

  

- Installation
- Widgets introduction
- Example

  

##  Installing

  
Add this line to pubspec

 
```yaml
dependencies:
	shaped_bottom_bar: ^1.1.0
```

  
  
##  Widgets

`ShapedBottomBar` This the main widget that will create the bottom bar.

With just two required parameters you get a full bottom bar.

**required parameters**

-  `onItemChanged` function that trigger every time you switch between items

-  `listItems` list of type `ShapedItemObject` that will be rendered in the bottom bar

this will create a simple bottom bar without any shape with just a different color for the selected item

**Other parameters**

-  `shape` variable of type `ShapeType` enum contains all available shapes, by default it's set to None

-  `shapeColor` the color of the shape once it selected, by default it's null

-  `customShape` a CustomPaint type passed to the bottom bar to render a custom shape other than the built-in shapes, **to use the customShape you need to set `shape` to `ShapeType.CUSTOM`**

PS: if you are using `customShape` the `shapeColor` parameter won't have any effect on your shape.

-  `selectedIconColor` the selected icon color, by default it's white

-  `backgroundColor` the background of the shaped bottom bar, by default it's blue

-  `selectedItemIndex` the default selected item, by default it's the first one (index 0)

-  `textStyle` the text style you want to have on the items text (color, size, font family...)

-  `animationType` attribute of type `ANIMATION_TYPE` let you choose the animation type possible values:

	- NONE
	- ROTATE
	- FADE
	- SLIDE_VERTICALLY

- `with3dEffect` enable/disable the 3D effect on bottom bar selected shape by default it's `False`

<hr>

  

`ShapedBottomBarItem` the widget that will be used in the `listItems` parameters in the `ShapedBottomBar` widget

This widget contains just four parameters.

**required parameters**

-  `icon` variable of type `IconData` it represent the icon that the item will get

**Other parameters**

-  `text` the item text, by default it's an empty text.

-  `themeColor` color that will be set to the icon. by default it's black

-  `renderWithText` by default it's false, this will indicate whether the widget will render the text or not.

##  Example

this will generate a normale bottom bar without any shape.

```dart
ShapedBottomBar(
	backgroundColor:  Colors.grey,
	listItems: [
		ShapedItemObject(iconData:  Icons.settings, title:  "Settings"),
		ShapedItemObject(iconData:  Icons.account_balance_outlined, title:  "Account"),
		ShapedItemObject(iconData:  Icons.verified_user_rounded, title:  "User"),
		ShapedItemObject(iconData:  Icons.login, title:  "Logout")
	],
	onItemChanged: (position) {
		setState(() {
			this.selectedItem = position;
		});
	},
	selectedIconColor:  Colors.white
)
```

And the example below will generate a bottom bar with an hexagon shape

```dart

ShapedBottomBar(
	backgroundColor:  Colors.grey,
	iconsColor:  Colors.white,
	listItems: [
		ShapedItemObject(iconData:  Icons.settings, title:  "Settings"),
		ShapedItemObject(iconData:  Icons.account_balance_outlined, title:  "Account"),
		ShapedItemObject(iconData:  Icons.verified_user_rounded, title:  "User"),
		ShapedItemObject(iconData:  Icons.login, title:  "Logout"),
	],
	onItemChanged: (position) {
		setState(() {
			this.selectedItem = position;
		});
	},
	shapeColor:  Colors.pink,
	selectedIconColor:  Colors.white,
	shape:  ShapeType.HEXAGONE
)

```

  

  

![Shaped bottom bar with hexagon shape](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/example/hexagon_shape_bottom_bar.png?raw=true)

  

  

##  Use your own custom shape

In order to create the shaped bottom bar with your own custom shape you need to use the parameter customShape with shape set to ShapeType.CUSTOM, as it shown below:

```dart

ShapedBottomBar(
	backgroundColor:  Colors.blue[50],
	iconsColor:  Color(0xFF020750),
	listItems: [
		ShapedItembject(iconData:  Icons.settings, title:  "Settings"),
		ShapedItemObject(iconData:  Icons.account_balance_outlined, title:  "Account"),
		ShapedItemObject(iconData:  Icons.verified_user_rounded, title:  "User"),
		ShapedItemObject(iconData:  Icons.login, title:  "Logout"),
	],
	onItemChanged: (position) {
		setState(() {
			this.selectedItem = position;
		});
	},
	textStyle:  TextStyle(color:  Colors.black, fontSize:  15),
	shape:  ShapeType.CUSTOM,
	customShape:  CustomPaint(
		painter:  MyShape(),
	))

```

  

![enter image description here](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/custom_shape_example.png?raw=true)

*

  

##  Use built-in animations

```dart

ShapedBottomBar(
	backgroundColor:  Colors.black12,
	iconsColor:  Colors.black,
	listItems: [
		ShapedItemObject(iconData:  Icons.alarm, title:  "Alarm"),
		ShapedItemObject(iconData:  Icons.menu_book, title:  "Menu"),
		ShapedItemObject(iconData:  Icons.verified_user_rounded, title:  "User"),
		ShapedItemObject(iconData:  Icons.login, title:  "Logout")
	],
	onItemChanged: (position) {
		setState(() {
			this.selectedItem = position;
		});
	},
	shape:  ShapeType.OCATGON,
	shapeColor:  Colors.black,
	selectedIconColor:  Colors.white,
	animationType:  ANIMATION_TYPE.ROTATE,
)

```

And the result:

![rotated_transition_example.gif](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/example/rotated_transition_example.gif?raw=true)

##  Use 3D Effect Attribute
```dart
ShapedBottomBar(
	backgroundColor:  Colors.black12,
	iconsColor:  Colors.black,
	listItems: [
		ShapedItemObject(iconData:  Icons.alarm, title:  "Alarm"),
		ShapedItemObject(iconData:  Icons.menu_book, title:  "Menu"),
		ShapedItemObject(iconData:  Icons.verified_user_rounded, title:  "User"),
		ShapedItemObject(iconData:  Icons.login, title:  "Logout"),
	],
	onItemChanged: (position) {
		setState(() {
			this.selectedItem = position;
		});
	},
	shape:  ShapeType.SQUARE,
	shapeColor:  Colors.pink,
	selectedIconColor:  Colors.white,
	with3dEffect:  true,
	animationType:  ANIMATION_TYPE.FADE
),
```
![square_with_3D_effect.png](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/example/square_with_3D_effect.png?raw=true)