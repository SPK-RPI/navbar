import 'package:flutter/material.dart';
import '../notesTabs/firstYear.dart';
import '../notesTabs/secondYear.dart';
import '../notesTabs/thirdYear.dart';

class SecondPage extends StatefulWidget {
  static String tag = 'NotesTabs_Page';
  @override
  SecondPageState createState() => new SecondPageState();
}

// SingleTickerProviderStateMixin is used for animation
class SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  /*
   *-------------------- Setup Tabs ------------------*
   */
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return new TabBar(
      
      indicatorColor: Colors.white,
      tabs: <Tab>[
        new Tab(
          // set icon to the tab
          icon: new Icon(Icons.looks_one),
        ),
        new Tab(
          icon: new Icon(Icons.looks_two),
        ),
        new Tab(
          icon: new Icon(Icons.looks_3),
        ),
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  /*
   *-------------------- Setup the page by setting up tabs in the body ------------------*
   */
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // Appbar
        appBar: new AppBar(
            // Title
            title: new Text("Notes"),
            // Set the background color of the App Bar
            backgroundColor: Colors.blue,
            // Set the bottom property of the Appbar to include a Tab Bar
            bottom: getTabBar()),
        // Set the TabBar view as the body of the Scaffold
        body: getTabBarView(
            <Widget>[new NotesfPage(), new NotessPage(), new NotestPage()]));
  }
}
