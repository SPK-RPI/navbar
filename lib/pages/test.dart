import 'package:flutter/material.dart';
class TestPage extends StatefulWidget {
  static const tag='sda';
  @override
  TestPageState createState() => new TestPageState();
}

class TestPageState extends State<TestPage> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Pdf View Plugin Demo',
      home: new Scaffold(
          appBar: new AppBar(
            title: const Text('Pdf View Plugin Demo'),
          ),
          body: new Padding(
            padding: const EdgeInsets.all(24.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  decoration: const InputDecoration(
                    labelText: 'Text:',
                    hintText: 'Enter some text',
                  ),
                  maxLines: 4,
                  onChanged: (String value) => setState(() {
                    text = value;
                  }),
                ),
                
              ],
            ),
          )),
    );
  }
}