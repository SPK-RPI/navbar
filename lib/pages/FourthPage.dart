import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  static String tag = 'fourth-page';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.cyanAccent[100],
          title: new Text('FourthPage'),
        ),
        body: new Container(
          color: Colors.cyanAccent[100],
        ));
  }
}
