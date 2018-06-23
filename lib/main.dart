import 'package:flutter/material.dart';
import './pages/FirstPage.dart';
import './pages/SecondPage.dart';
import 'LoginPage.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new LoginPage(),
      
      );
  
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Navigation bar'),
        elevation: 10.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              currentAccountPicture: new CircleAvatar(
                child: new Icon(Icons.accessibility),
                backgroundColor: Colors.white,
              ),
              accountEmail: new Text('shivaprasadkar50@gmail.com'),
              accountName: new Text('Shiva prasad kar'),
            ),
            new ListTile(
              title: new Text("First Page"),
              trailing: new Icon(Icons.arrow_forward),
             onTap: (){
               Navigator.of(context).pop();
               Navigator.of(context).push(new MaterialPageRoute(
                 builder: (BuildContext context)=>new FirstPage('First Page')));
               
             },
             ),
            new Divider(),
            new ListTile(
              title: new Text("Second Page"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: (){
               Navigator.of(context).pop();
               Navigator.of(context).push(new MaterialPageRoute(
                 builder: (BuildContext context)=>new SecondPage('Second Page')));
               
             },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Third Page"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: (){
               Navigator.of(context).pop();
               Navigator.of(context).push(new MaterialPageRoute(
                 builder: (BuildContext context)=>new SecondPage('Third Page')));
               
             },
            ),
            new Divider(),
          ],
        ),
      ),
      body: new RaisedButton(
        child: new Text('Go to log in'),
        onPressed: (){
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
                 builder: (BuildContext context)=>new LoginPage()));
        },
      ),
      
    );
    
  }

}
