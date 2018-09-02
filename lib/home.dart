import 'dart:async';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import './pages/ThirdPage.dart';
import './pages/FirstPage.dart';
import './pages/SecondPage.dart';
import './pages/FourthPage.dart';
import './pages/FifthPage.dart';
import './pages/test.dart';
 
class HomePage extends StatelessWidget{
  final FirebaseUser user;
   HomePage({Key key, this.user}) : super(key: key);
  static String tag = 'home-page';

    
  

  @override
  Widget build(BuildContext context) {
    //===============================================================================================
    final card = new Card(
      // margin: EdgeInsets.all(8.0),
      elevation: 10.0,
      color: Colors.white.withAlpha(150),
      child: new Container(
          // margin: EdgeInsets.all(8.0),
          child: ListView(
        children: <Widget>[
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  text: "What is BscIT?"),
            ),
            subtitle: Text(
                "A Bachelor of Science in Information Technology,(abbreviated BSIT or B.Sc IT), is a Bachelor's degree awarded for an undergraduate course or program in the Information technology field. The degree is normally required in order to work in the Information technology industry."),
          ),
        ],
      )),
    );
//==============================================================================================
    final avtar = new UserAccountsDrawerHeader(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://i.pinimg.com/originals/e2/90/9a/e2909aab62a0d9f7a4dcd095d2bdf069.gif")),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.teal),
      margin: EdgeInsets.all(5.0),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: new NetworkImage(user.photoUrl),
      ),
      accountEmail: new Text(
        user.email,
        style: TextStyle(
          decorationStyle: TextDecorationStyle.dashed,
          decoration: TextDecoration.overline,
          color: Colors.white,
          fontFamily: 'Schyler',
        ),
      ),
      accountName: new Text(
        user.displayName,
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
//===============================================================================================
    final item1 = new ListTile(
      leading: Icon(Icons.library_books, color: Colors.red),
      title: new Text("Syllabus"),
      trailing: new Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(FirstPage.tag);
      },
    );
//===============================================================================================
    final item2 = new ListTile(
        leading: Icon(
          Icons.book,
          color: Colors.blueAccent,
        ),
        title: new Text("Notes"),
        trailing: new Icon(Icons.arrow_forward),
        onTap: (){Navigator.of(context).pop();
        Navigator.of(context).pushNamed(SecondPage.tag);});
//===============================================================================================
    final item2_1 = new ListTile(
      leading: Icon(
        Icons.book,
        color: Colors.blueAccent,
      ),
      title: new Text("Notes First Year"),
      trailing: new Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(SecondPage.tag);
      },
    );
//===============================================================================================
    final item3 = new ListTile(
      leading: Icon(Icons.edit, color: Colors.deepPurple),
      title: new Text("Question Papers"),
      trailing: new Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(ThirdPage.tag);
      },
    );
//===============================================================================================
    final item4 = new ListTile(
      leading: Icon(Icons.build, color: Colors.cyan),
      title: new Text("Projects"),
      trailing: new Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(FourthPage.tag);
      },
    );
//===============================================================================================
    final item5 = new ListTile(
      leading: Icon(Icons.bookmark, color: Colors.blueGrey),
      title: new Text("Black Books"),
      trailing: new Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(FifthPage.tag);
      },
    );
    final item6 = new ListTile(
      leading: Icon(Icons.bookmark),
      title: new Text("Test PAGE"),
      trailing: new Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(TestPage.tag);
      },
    );
//===============================================================================================
    final drawer = new Drawer(
      elevation: 10.0,
      child: new ListView(addRepaintBoundaries: true, children: <Widget>[
        avtar,
        item1,
        item2,
        item3,
        item4,
        item5,
        item6,
      ]),
    );
//==========================================================================================
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text('Home Page'),
        elevation: 10.0,
      ),
      drawer: drawer,
//============================================================ Drawer ========================
      body: new Container(padding: EdgeInsets.all(10.0), child: card),
    );
    
  }
}
