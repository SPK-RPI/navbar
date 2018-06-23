import 'package:flutter/material.dart';
class SecondPage extends StatelessWidget {
 final String title;
  @override
   SecondPage(this.title);
  Widget build(BuildContext context){
   return new Scaffold(
appBar: new AppBar(
title: new Text(title),

),
body: new Container(
  
child:new Text(title),

) 
   );
}
}