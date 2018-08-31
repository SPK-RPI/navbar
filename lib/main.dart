import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'home.dart';
import './pages/FirstPage.dart';
import './pages/SecondPage.dart';
import './pages/ThirdPage.dart';
import './pages/FourthPage.dart';
import './pages/FifthPage.dart';
import './pages/test.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:simple_permissions/simple_permissions.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAnalytics analytics = new FirebaseAnalytics();
  final routes = <String, WidgetBuilder>{
    
    TestPage.tag: (context) => new TestPage(),
    LoginPage.tag: (context) => new LoginPage(),
    HomePage.tag: (context) => new HomePage(),
    FirstPage.tag: (context) => new FirstPage(),
    SecondPage.tag: (context) => new SecondPage(),
    ThirdPage.tag: (context) => new ThirdPage(),
    FourthPage.tag: (context) => new FourthPage(),
    FifthPage.tag: (context) => new FifthPage(),
  };
 

  @override
  initState() {
    super.initState();
    //getPermissionStatus();
    requestPermission();
  }

 

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
   requestPermission() async {
    bool res = await SimplePermissions
        .requestPermission(Permission.WriteExternalStorage);
    print("permission request result is " + res.toString());
  
  }
}
