import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  static String tag = 'third-page';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.purpleAccent[100],
          title: new Text('Third Page'),
        ),
        body: new Container(
          color: Colors.purpleAccent[100],
          
        ));
  }
}
