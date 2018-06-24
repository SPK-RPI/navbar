import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'home.dart';
import './pages/FirstPage.dart';
import './pages/SecondPage.dart';
import './pages/ThirdPage.dart';
import 'RegisterPage.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  FirebaseAnalytics analytics = new FirebaseAnalytics();
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
     RegisterPage.tag: (context) => RegisterPage(),
    HomePage.tag: (context) => HomePage(),
    FirstPage.tag:(context)=>FirstPage(),
    SecondPage.tag:(context)=>SecondPage(),
    ThirdPage.tag:(context)=>ThirdPage()
  };
@override
  
   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shiva',
      debugShowCheckedModeBanner: false,
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
