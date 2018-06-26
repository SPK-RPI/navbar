import 'package:flutter/material.dart';
class ThirdPage extends StatelessWidget {
  static String tag = 'third-page';
  @override
  Widget build(BuildContext context){
   return new Scaffold(
appBar: new AppBar(
title: new Text('Third Page'),

),
body: new Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
          
              borderRadius: BorderRadius.circular(20.0), color: Color.fromRGBO(180, 202, 237,0.9)
              
              ),
      )
   );
}
}