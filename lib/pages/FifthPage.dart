import 'package:flutter/material.dart';
class FifthPage extends StatelessWidget {
  static String tag = 'fifth-page';
  @override
  Widget build(BuildContext context){
   return new Scaffold(
appBar: new AppBar(
title: new Text('Fifth Page'),

),
body: new Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), color:  Color.fromRGBO(180, 202, 237,0.9)
              
              ),
      )
   );
}
}