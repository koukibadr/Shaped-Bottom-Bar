
# shaped bottom bar

  

A new bottom bar in Flutter! a shaped bottom bar.

Choose your shape (circle, square, hexagon...) and let us do the work.

  ![enter image description here](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/example/shaped_bottom_bar_hexagon.gif?raw=true)

 - Installation
 - Widgets introduction
 - Example

## Installing

Add this line to pubspec

    dependencies:
	    shaped_bottom_bar: ^0.0.1


## Widgets

`ShapedBottomBar` This the main widget that will create the bottom bar.
With just two required parameters you get a full bottom bar.

**required parameters**
 - `onItemChanged` function that trigger every time you switch between items
 - `listItems` list of type `ShapedItemObject` that will be rendered in the bottom bar
 
this will create a simple bottom bar without any shape with just a different color for the selected item

**Other parameters**

 - `shape` variable of type `ShapeType` enum contains all available shapes, by default it's set to None
 - `shapeColor` the color of the shape once it selected, by default it's null
 - `selectedIconColor` the selected icon color, by default it's white
 - `backgroundColor` the background of the shaped bottom bar, by default it's blue
 - `selectedItemIndex` the default selected item, by default it's the first one (index  0)
<hr>

`ShapedBottomBarItem` the widget that will be used in the `listItems` parameters in the `ShapedBottomBar` widget
This widget contains just four parameters.

**required parameters**

 - `icon` variable of type `IconData` it represent the icon that the item will get
 
 **Other parameters**
 
 - `text` the item text, by default it's an empty text.
 - `themeColor` color that will be set to the icon. by default it's black
 - `renderWithText` by default it's false, this will indicate whether the widget  will render the text or not.


## Example
this will generate a normale bottom bar  without any shape.


    ShapedBottomBar(
	 	backgroundColor: Colors.grey,
	    listItems: [
	       ShapedItemObject(iconData: Icons.settings, title: "Settings"),
	       ShapedItemObject(iconData: Icons.account_balance_outlined, title: "Account"),
	       ShapedItemObject(iconData: Icons.verified_user_rounded, title: "User"),
	       ShapedItemObject(iconData: Icons.login, title: "Logout"),
	      ],
	   onItemChanged: (position) {
         setState(() {
            this.selectedItem = position;
         });
      },
      selectedIconColor: Colors.white
	)


And the example below will generate a  bottom bar with an hexagon shape

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


![Shaped bottom bar with hexagon shape](https://github.com/koukibadr/Shaped-Bottom-Bar/blob/main/example/hexagon_shape_bottom_bar.png?raw=true)


Happy to get your issues and feedback on the project repository in the link below:
[Link to repository](https://github.com/koukibadr/Shaped-Bottom-Bar)
