import 'package:flutter/material.dart';
class FirstPage extends StatelessWidget {
 final String title;
  @override
   FirstPage(this.title);
  Widget build(BuildContext context){
   return new Scaffold(
appBar: new AppBar(
title: new Text(title),

),
body: new Container(
child:new BottomAppBar(
  child: new Text('This is a test'),
)

) 
   );
}
}