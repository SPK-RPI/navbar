import 'dart:async';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:simple_permissions/simple_permissions.dart';
import '../dialogs.dart';

class NotesfPage extends StatefulWidget {
  static String tag = 'nfYear';
  @override
  NotesfPageState createState() => NotesfPageState();
}

class NotesfPageState extends State<NotesfPage> {
  Dialogs dialogs = new Dialogs();
  Dio dio = Dio();

  bool downloading = false;
  bool downloading1 = false;
  bool downloading2 = false;
  bool downloading3 = false;
  bool downloading4 = false;

  var proSring = "";
  double value = 0.0;

  bool fStateip = false;
  bool fStatede = false;
  bool fStateos = false;
  bool fStatedm = false;
  bool fStatecs = false;

  final ipdp = 'Imperative_Programming_notes.pdf';
  final dedp = 'Digital-Electronics-Notes.pdf';
  final osdp = "Operating-System-Notes.pdf";
  final dmdp = "Discrete-Mathematics-Notes.pdf";
  final csdp = "Communication-Skills-Notes.pdf";
  
  String ip =
      "https://drive.google.com/uc?export=download&id=1SXzpiA1ayfMpf-FMVQrZWYaE7GHN9cKP";
  String de =
      'https://drive.google.com/uc?export=download&id=1JhlXtqR5RFLPDSJsaSvF_aEWs9VHQ3bc';
  String os =
      'https://drive.google.com/uc?export=download&id=1KrqNSby6Ihojhb6kz44GMgZorUnlnFIT';
  String dm =
      'https://drive.google.com/uc?export=download&id=1vIVD_Y5S9cj8flZyq0lSwJrC1tbyyyyv';
  String cs =
      'https://drive.google.com/uc?export=download&id=1TbPDhZby-lxygdqnw6XYuIgjCVsfuLzk';

//=========================================================== SEMISTER 1 ========================================      
  @override
  void initState() {
    super.initState();
    checkFile();
    
  }
  Future<void> checkFile() async {
    final dir = await getExternalStorageDirectory();
    final dpath = "${dir.path}";
    final File file = File("$dpath/$ipdp");
    final File file1 = File('${dir.path}/Digital-Electronics-Notes.pdf');
    final File file2 = File('${dir.path}/Operating-System-Notes.pdf');
    final File file3 = File('${dir.path}/Discrete-Mathematics-Notes.pdf');
    final File file4 = File('${dir.path}/Communication-Skills-Notes.pdf');
    setState(() {
      if (file.existsSync() == true) {
        fStateip = true;
      } else {
        fStateip = false;
      }
      if (file1.existsSync() == true) {
        fStatede = true;
      } else {
        fStatede = false;
      }
      if (file2.existsSync() == true) {
        fStateos = true;
      } else {
        fStateos = false;
      }
      if (file3.existsSync() == true) {
        fStatedm = true;
      } else {
        fStatedm = false;
      }
      if (file4.existsSync() == true) {
        fStatecs = true;
      } else {
        fStatecs = false;
      }
    });
  }

//==================================================================================================
  Future<void> downloadFn(String dpath, int fileS, String url) async {
    dialogs.information(
        context, value, "| Downloading |", "Please wait..", false);
    await dio.download(url, dpath, onProgress: (rec, total) {
      setState(() {
        value = ((rec / fileS) * 100);
        proSring = value.toStringAsFixed(0) + "%";
      });

      print(proSring);
    });
  }

//===================================================================================================
  Future<void> downloadFile(int subject) async {
   final dir = await getExternalStorageDirectory();
    final dpath = "${dir.path}";
    if (subject == 1) {
      setState(() {
        downloading = true;
      });
      downloadFn("$dpath/$ipdp", 12132961, ip).whenComplete(() {
        checkFile();
        Navigator.of(context).pop();
        downloading = false;
      });
    } else if (subject == 2) {
      setState(() {
        downloading1 = true;
      });
      downloadFn("$dpath/$dedp", 9476463, de).whenComplete(() {
        checkFile();
        Navigator.of(context).pop();
        downloading1 = false;
      });
    } else if (subject == 3) {
      setState(() {
        downloading2 = true;
      });
      downloadFn("$dpath/$osdp", 6556637, os).whenComplete(() {
        checkFile();
        Navigator.of(context).pop();
        downloading2 = false;
      });
    } else if (subject == 4) {
      setState(() {
        downloading3 = true;
      });
      downloadFn("$dpath/$dmdp", 16126000, dm).whenComplete(() {
        checkFile();
        Navigator.of(context).pop();
        downloading3 = false;
      });
    } else if (subject == 5) {
      setState(() {
        downloading4 = true;
      });
      downloadFn("$dpath/$csdp", 18713057 , cs).whenComplete(() {
        checkFile();
        Navigator.of(context).pop();
        downloading4 = false;
      });
    }
  }

//=====================================================================================================
  Future<String> openFile(int subject) async {
    final dir = await getExternalStorageDirectory();
    final dpath = "${dir.path}";
    if (subject == 1) {
      return await OpenFile.open("$dpath/$ipdp");
    } else if (subject == 2) {
      return await OpenFile.open("$dpath/$dedp");
    } else if (subject == 3) {
      return await OpenFile.open("$dpath/$osdp");
    } else if (subject == 4) {
      return await OpenFile.open("$dpath/$dmdp");
    } else if (subject == 5) {
      return await OpenFile.open("$dpath/$csdp");
    }
  }

//===================================================================================================
  requestPermission() async {
    bool res = await SimplePermissions.requestPermission(
        Permission.WriteExternalStorage);
    print("permission request result is " + res.toString());
  }

//==================================================================================

  /* information(double value, String text) {
     return showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text(text),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('Please Wait..'),
              new LinearProgressIndicator(value:value/100),

                

            ],
          ),
        ),
        
      );
    },
  );
  } */

//==========================================================================================

//=============================================================================================
  Widget ipbdownload() {
    return Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            new ListTile(
              leading: Icon(
                Icons.file_download,
                color: Colors.redAccent,
              ),
              title: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    text: "Downloading : $proSring"),
              ),
            ),
            new CircularProgressIndicator(
              value: value / 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget ipadownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            ListTile(
              subtitle: Text("will come soon hold on.."),
              leading: Icon(Icons.book, size: 59.0, color: Colors.redAccent),
              title: new RichText(
                text: TextSpan(
                  text: "Imperative Programming",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.wavy,
                      letterSpacing: 1.0,
                      color: Colors.black,
                      fontSize: 20.7),
                ),
              ),
            ),
            fStateip
                ? new RaisedButton(
                    shape: StadiumBorder(
                        side: BorderSide(
                      style: BorderStyle.solid,
                      //width: 30.0
                    )),
                    child: Text("Open"),
                    color: Colors.greenAccent,
                    onPressed: () => openFile(1),
                  )
                : new RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    shape: StadiumBorder(
                        side: BorderSide(style: BorderStyle.solid)),
                    elevation: 6.0,
                    color: Colors.blueAccent,
                    child: Text("Download"),
                    onPressed: () {
                      downloadFile(1);
                      //dialogs.information(context, value, "Downloading..");
                    }),
          ],
        ),
      ),
    );
  }

  Widget debdownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            new ListTile(
              leading: Icon(
                Icons.file_download,
                color: Colors.redAccent,
              ),
              title: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    text: "Downloading :$proSring"),
              ),
            ),
            new CircularProgressIndicator(
              value: value / 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget deadownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            ListTile(
              subtitle: Text("Hold on it is under process"),
              leading: Icon(Icons.book, size: 59.0, color: Colors.redAccent),
              title: new RichText(
                text: TextSpan(
                  text: "Digital Electronics",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.wavy,
                      letterSpacing: 1.0,
                      color: Colors.black,
                      fontSize: 20.7),
                ),
              ),
            ),
            fStatede
                ? new RaisedButton(
                    shape: StadiumBorder(
                        side: BorderSide(
                      style: BorderStyle.solid,
                      //width: 30.0
                    )),
                    child: Text("Open"),
                    color: Colors.greenAccent,
                    onPressed: () => openFile(2),
                  )
                : new RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    shape: StadiumBorder(
                        side: BorderSide(style: BorderStyle.solid)),
                    elevation: 6.0,
                    color: Colors.blueAccent,
                    child: Text("Download"),
                    onPressed: () => downloadFile(2),
                  ),
          ],
        ),
      ),
    );
  }

  Widget osbdownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            new ListTile(
              leading: Icon(
                Icons.file_download,
                color: Colors.redAccent,
              ),
              title: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    text: "Downloading :$proSring"),
              ),
            ),
            new CircularProgressIndicator(
              value: value / 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget osadownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            ListTile(
              subtitle: Text("This text is under process"),
              leading: Icon(Icons.book, size: 59.0, color: Colors.redAccent),
              title: new RichText(
                text: TextSpan(
                  text: "Operating System",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.wavy,
                      letterSpacing: 1.0,
                      color: Colors.black,
                      fontSize: 20.7),
                ),
              ),
            ),
            fStateos
                ? new RaisedButton(
                    shape: StadiumBorder(
                        side: BorderSide(
                      style: BorderStyle.solid,
                      //width: 30.0
                    )),
                    child: Text("Open"),
                    color: Colors.greenAccent,
                    onPressed: () => openFile(3),
                  )
                : new RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    shape: StadiumBorder(
                        side: BorderSide(style: BorderStyle.solid)),
                    elevation: 6.0,
                    color: Colors.blueAccent,
                    child: Text("Download"),
                    onPressed: () => downloadFile(3),
                  ),
          ],
        ),
      ),
    );
  }

  Widget dmbdownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            new ListTile(
              leading: Icon(
                Icons.file_download,
                color: Colors.redAccent,
              ),
              title: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    text: "Downloading :$proSring"),
              ),
            ),
            new CircularProgressIndicator(
              value: value / 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget dmadownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            ListTile(
              subtitle: Text("This is under process please hold on"),
              leading: Icon(Icons.book, size: 59.0, color: Colors.redAccent),
              title: new RichText(
                text: TextSpan(
                  text: "Discrete Mathematics",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.wavy,
                      letterSpacing: 1.0,
                      color: Colors.black,
                      fontSize: 20.7),
                ),
              ),
            ),
            fStatedm
                ? new RaisedButton(
                    shape: StadiumBorder(
                        side: BorderSide(
                      style: BorderStyle.solid,
                      //width: 30.0
                    )),
                    child: Text("Open"),
                    color: Colors.greenAccent,
                    onPressed: () => openFile(4),
                  )
                : new RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    shape: StadiumBorder(
                        side: BorderSide(style: BorderStyle.solid)),
                    elevation: 6.0,
                    color: Colors.blueAccent,
                    child: Text("Download"),
                    onPressed: () => downloadFile(4),
                  ),
          ],
        ),
      ),
    );
  }

  Widget csbdownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            new ListTile(
              leading: Icon(
                Icons.file_download,
                color: Colors.redAccent,
              ),
              title: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    text: "Downloading :$proSring"),
              ),
            ),
            new CircularProgressIndicator(
              value: value / 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget csadownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            ListTile(
              subtitle: Text("This one too under process please hold on"),
              leading: Icon(Icons.book, size: 59.0, color: Colors.redAccent),
              title: new RichText(
                text: TextSpan(
                  text: "Communication Skills",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.wavy,
                      letterSpacing: 1.0,
                      color: Colors.black,
                      fontSize: 20.7),
                ),
              ),
            ),
            fStatecs
                ? new RaisedButton(
                    shape: StadiumBorder(
                        side: BorderSide(
                      style: BorderStyle.solid,
                      //width: 30.0
                    )),
                    child: Text("Open"),
                    color: Colors.greenAccent,
                    onPressed: () => openFile(5),
                  )
                : new RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    shape: StadiumBorder(
                        side: BorderSide(style: BorderStyle.solid)),
                    elevation: 6.0,
                    color: Colors.blueAccent,
                    child: Text("Download"),
                    onPressed: () => downloadFile(5),
                  ),
          ],
        ),
      ),
    );
  }

//======================================================================================================

//==================================================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              //new SizedBox(height: 40.0),

              new RichText(
                text: TextSpan(
                    style: TextStyle(
                      letterSpacing: 5.0,
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    text: "Semister I"),
              ),
              downloading ? ipbdownload() : ipadownload(),

              //new SizedBox(height: 40.0),

              downloading1 ? debdownload() : deadownload(),
              // new SizedBox(height: 40.0),

              downloading2 ? osbdownload() : osadownload(),

              downloading3 ? dmbdownload() : dmadownload(),
              downloading4 ? csbdownload() : csadownload(),
              new RichText(
                text: TextSpan(
                    style: TextStyle(
                      letterSpacing: 5.0,
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    text: "Semister II"),
              ),
            ],
          ),
        ));
  }
}
