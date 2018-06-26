import 'package:flutter/material.dart';
class FirstPage extends StatelessWidget {
  static String tag = 'First-page';
  @override
  Widget build(BuildContext context){
   return new Scaffold(
appBar: new AppBar(
  
title: new Text('Syllabus'),

),
body:  new Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), color:  Color.fromRGBO(180, 202, 237,0.9)
              
              ),
      )
   );
}
}