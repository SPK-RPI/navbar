 import 'package:flutter/material.dart';
 import 'LoginPage.dart';
 import 'package:firebase_auth/firebase_auth.dart';
 import 'dart:async';
import './pages/ThirdPage.dart';
import './pages/FirstPage.dart';
import './pages/SecondPage.dart';
 class HomePage extends StatelessWidget {
  static String tag = 'home-page';
 final  FirebaseUser user;
 HomePage({Key key,this.user}):super(key :key);
  @override
  Widget build(BuildContext context){
 return Scaffold(
      appBar: new AppBar(
        title: new Text('Navigation bar'),
        elevation: 10.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          addRepaintBoundaries: true,
          children: <Widget>[
            new UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.teal
            ),
              currentAccountPicture: new CircleAvatar(
              
                backgroundImage:new NetworkImage(user.photoUrl),
                
              ),
              accountEmail: new Text(user.email),
              accountName: new Text(user.displayName)
            ),
          
            new ListTile(
              
              title: new Text("First Page"),
              trailing: new Icon(Icons.arrow_forward),
             onTap: (){
               Navigator.of(context).pop();
               Navigator.of(context).pushNamed(FirstPage.tag);
               
             },
             ),
            new Divider(
              color: Colors.teal,
            ),
            new ListTile(
              title: new Text("Second Page"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: (){
               Navigator.of(context).pop();
            Navigator.of(context).pushNamed(SecondPage.tag);
               
             },
            ),
            new Divider(
              color: Colors.teal,
            ),
            new ListTile(
              title: new Text("Third Page"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: (){
               Navigator.of(context).pop();
              Navigator.of(context).pushNamed(ThirdPage.tag);
               
             },
            ),
            new Divider(
              color: Colors.teal,
            ),
          ],
        ),
      ),
      body: new RaisedButton(
        child: new Text('Go to log in'),
        onPressed: (){
        Navigator.of(context).pushReplacementNamed(LoginPage.tag);
        },
      ),
      
    );
 }
 }