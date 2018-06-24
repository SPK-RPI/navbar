import 'package:flutter/material.dart';
class ThirdPage extends StatelessWidget {
  static String tag = 'third-page';
  @override
  Widget build(BuildContext context){
   return new Scaffold(
appBar: new AppBar(
title: new Text('Third Page'),

),
body: new Center(
child:new Text('Third Page'),
) 
   );
}
}