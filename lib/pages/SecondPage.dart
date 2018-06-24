import 'package:flutter/material.dart';
class SecondPage extends StatelessWidget {
  static String tag = 'second-page';
  @override
  Widget build(BuildContext context){
   return new Scaffold(
appBar: new AppBar(
title: new Text('Second Page'),

),
body: new Container(
  
child:new Text('Second Page'),

) 
   );
}
}