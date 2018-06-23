import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
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
              title: new Text("page 1"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: FirstPage(),
            ),
            new Divider(),
            new ListTile(
              title: new Text("page 2"),
              trailing: new Icon(Icons.arrow_forward),
            ),
            new Divider(),
            new ListTile(
              title: new Text("page 3"),
              trailing: new Icon(Icons.arrow_forward),
            ),
            new Divider(),
          ],
        ),
      ),
      body: new Container(
        child: new Center(child: new Text('Hpme Page')),
      ),
    );
  }

  FirstPage() {}
}
