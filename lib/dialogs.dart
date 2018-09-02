import 'package:flutter/material.dart';

class Dialogs {

  information(BuildContext context,double value, String text,String description,bool dismissable) {
     return showDialog<Null>(
    context: context,
    barrierDismissible: dismissable, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text(text),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text(description),
              new LinearProgressIndicator(),

                

            ],
          ),
        ),
        
      );
    },
  );
  }
}
