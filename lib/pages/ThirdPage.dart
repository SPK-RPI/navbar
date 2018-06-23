import 'package:flutter/material.dart';
class ThirdPage extends StatelessWidget {
 final String title;
  @override
   ThirdPage(this.title);
  Widget build(BuildContext context){
   return new Scaffold(
appBar: new AppBar(
title: new Text(title),

),
body: new Center(
child:new Text(title),
) 
   );
}
}