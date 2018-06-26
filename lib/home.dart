import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import './pages/ThirdPage.dart';
import './pages/FirstPage.dart';
import './pages/SecondPage.dart';
import './pages/FourthPage.dart';
import './pages/FifthPage.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  final FirebaseUser user;
  HomePage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        
        actions: <Widget>[
           new IconButton(
             onPressed: ()=>Navigator.of(context).pushReplacementNamed(LoginPage.tag),
          icon: Icon(Icons.settings),
       
        ),
        ],
        title: new Text('Home Page'),
        elevation: 10.0,
      ),
      drawer: new Drawer(
        elevation: 10.0,
        child: new ListView(
          addRepaintBoundaries: true,
          children: <Widget>[
            new UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.teal),
                margin: EdgeInsets.all(10.0),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage(user.photoUrl),
                ),
                accountEmail: new Text(
                  user.email,
                  style: TextStyle(
                    fontFamily: 'Schyler',
                  ),
                ),
                accountName: new Text(user.displayName)),
            //============================================================================================

            new ListTile(
              leading: Icon(Icons.library_books),
              title: new Text("Syllabus"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(FirstPage.tag);
              },
            ),
            new ListTile(
              leading: Icon(Icons.book),
              title: new Text("Notes"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(SecondPage.tag);
              },
            ),

            new ListTile(
              leading: Icon(Icons.edit),
              title: new Text("Question Papers"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(ThirdPage.tag);
              },
            ),
            new ListTile(
              leading: Icon(Icons.build),
              title: new Text("Projects"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(FourthPage.tag);
              },
            ),
            new ListTile(
              leading: Icon(Icons.bookmark),
              title: new Text("Black Books"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(FifthPage.tag);
              },
            ),
          ],
        ),
      ),
      //============================================================ Drawer ========================
      body:new Container(
       padding: EdgeInsets.all(10.0),
         child:new Card(
           margin: EdgeInsets.all(8.0),
           shape: Material().shape,
        elevation: 10.0,
                color: Color.fromRGBO(239, 178, 98,0.1),
                child: ListView(
                  children: <Widget>[
                    Text(
                  'What is BscIT ?',
                style:TextStyle(
                  fontSize: 50.0,
                ) ,
                ),
                Text("A Bachelor of Science in Information Technology, (abbreviated BSIT or B.Sc IT), is a Bachelor's degree awarded for an undergraduate course or program in the Information technology field. The degree is normally required in order to work in the Information technology industry.A Bachelor of Science in Information Technology degree program typically takes three to four years depending on the country. This degree is primarily focused on subjects such as software, databases, and networking. In general, computer science degrees tend to focus on the mathematical and theoretical foundations of computing rather than emphasizing specific technologies. The degree is a Bachelor of Science degree with institutions conferring degrees in the fields of information technology and related fields. This degree is awarded for completing a program of study in the field of software development, software testing, software engineering, web design, databases, programming, computer networking and computer systems.Graduates with an information technology background are able to perform technology tasks relating to the processing, storing, and communication of information between computers, mobile phones, and other electronic devices. Information technology as a field emphasizes the secure management of large amounts of variable information and its accessibility via a wide variety of systems both local and worldwide.[1]")
                  ],
                )
              ),
      ),
      
              
              
      

    );
  }
}
