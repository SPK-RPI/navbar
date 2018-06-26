import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'home.dart';
import './pages/FirstPage.dart';
import './pages/SecondPage.dart';
import './pages/ThirdPage.dart';
import './pages/FourthPage.dart';
import './pages/FifthPage.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
 final FirebaseAnalytics analytics = new FirebaseAnalytics();
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    FirstPage.tag:(context)=>FirstPage(),
    SecondPage.tag:(context)=>SecondPage(),
    ThirdPage.tag:(context)=>ThirdPage(),
    FourthPage.tag:(context)=>FourthPage(),
    FifthPage.tag:(context)=>FifthPage(),
  };
@override
  
   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourBscIT',
     
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Raleway',
      ),
      home: LoginPage(),
      routes: routes,
      navigatorObservers: [
    new FirebaseAnalyticsObserver(analytics: analytics),
  ],
    );
  }
}
