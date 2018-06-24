import 'package:flutter/material.dart';
class FirstPage extends StatelessWidget {
  static String tag = 'First-page';
  @override
  Widget build(BuildContext context){
   return new Scaffold(
appBar: new AppBar(
title: new Text('First Page'),

),
body: new Container(
child:new BottomAppBar(
  child: new Text('This is a test'),
)

) 
   );
}
}