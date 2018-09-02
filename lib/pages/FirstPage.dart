import 'dart:async';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import '../dialogs.dart';

class FirstPage extends StatefulWidget {
  static String tag = 'first_Page';

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Dialogs dialogs = new Dialogs();
  bool downloading = false;
  Dio dio = Dio();

  bool downloading1 = false;

  bool downloading2 = false;

  var proSring = "";
  double value = 0.0;
  double value2 = 0.0;
  double value3 = 0.0;
  bool fStatef = false;
  bool fStates = false;
  bool fStatet = false;
  String url;

  final fydpath = "4.76-FYBScIT-Syllabus-2016-17.pdf";
  final sydpath = "SYBSCIT-Syllabus-2017-2018.pdf";
  final thdpath = "TYBSCIT-Syllabus-2017-2018.pdf";

  final fyesr =
      "http://mybscit.com/wp-content/uploads/2016/07/4.76-FYBScIT-Syllabus-2016-17.pdf";
  final syear =
      'http://mybscit.com/wp-content/uploads/2016/12/SYBSCIT-Syllabus-2017-2018.pdf';
  final tyear = 'http://archive.mu.ac.in/syllabus/4.129%20TYBSC%20IT.pdf';

  @override
  void initState() {
    super.initState();
    checkFile();
  }

//=================================================================================================
  Future<void> downloadFn(String dpath, String url) async {
    dialogs.information(
        context, value, "| Downloading |", "Please wait..", false);
    await dio.download(url, dpath, onProgress: (rec, total) {
      setState(() {
        value = ((rec / total) * 100);
        proSring = value.toStringAsFixed(0) + "%";
      });

      print(proSring);
    });
  }

//==================================================================================================
  Future<void> checkFile() async {
    final dir = await getExternalStorageDirectory();
    final dpath = "${dir.path}";
    final File file = File('$dpath/$fydpath');
    final File file1 = File('$dpath/$sydpath');
    final File file2 = File('$dpath/$thdpath');
    setState(() {
      if (file.existsSync() == true) {
        fStatef = true;
      } else {
        fStatef = false;
      }
      if (file1.existsSync() == true) {
        fStates = true;
      } else {
        fStates = false;
      }
      if (file2.existsSync() == true) {
        fStatet = true;
      } else {
        fStatet = false;
      }
    });
  }

//===================================================================================================
  Future<void> downloadFile(int year) async {
    var dir = await getExternalStorageDirectory();
    final dpath = "${dir.path}";
    if (year == 1) {
      setState(() {
        downloading = true;
      });
      downloadFn("$dpath/$fydpath", "$fyesr").whenComplete(() {
        checkFile();
        Navigator.of(context).pop();
        downloading = false;
      });
    } else if (year == 2) {
      setState(() {
        downloading1 = true;
      });
      downloadFn("$dpath/$sydpath", "$syear").whenComplete(() {
        checkFile();
        Navigator.of(context).pop();
        downloading1 = false;
      });
    } else if (year == 3) {
      setState(() {
        downloading2 = true;
      });
      downloadFn("$dpath/$thdpath", "$tyear").whenComplete(() {
        checkFile();
        Navigator.of(context).pop();
        downloading2 = false;
      });
    }
  }

//=====================================================================================================
  Future<String> openFile(int year) async {
    final dir = await getExternalStorageDirectory();
    final dpath = "${dir.path}";
    if (year == 1) {
      return await OpenFile.open("$dpath/$fydpath");
    } else if (year == 2) {
      return await OpenFile.open("$dpath/$sydpath");
    } else if (year == 3) {
      return await OpenFile.open("$dpath/$thdpath");
    }
  }

//===================================================================================================

//==================================================================================

//==========================================================================================
  fybdownload() {
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

  Widget fyadownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            ListTile(
              subtitle: Text("This syllabus is for year (2016/2017)"),
              leading: Icon(Icons.looks_one, color: Colors.redAccent),
              title: new RichText(
                text: TextSpan(
                  text: "First Year Syllabus",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.wavy,
                      letterSpacing: 1.0,
                      color: Colors.black,
                      fontSize: 20.7),
                ),
              ),
            ),
            fStatef
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
                    onPressed: () => downloadFile(1),
                  ),
          ],
        ),
      ),
    );
  }

  Widget sybdownload() {
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
              value: value2 / 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget syadownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            ListTile(
              subtitle: Text("This syllabus is for year (2016/2017)"),
              leading: Icon(Icons.looks_two, color: Colors.redAccent),
              title: new RichText(
                text: TextSpan(
                  text: "Second Year Syllabus",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.wavy,
                      letterSpacing: 1.0,
                      color: Colors.black,
                      fontSize: 20.7),
                ),
              ),
            ),
            fStates
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

  Widget tybdownload() {
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
              value: value3 / 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget tyadownload() {
    return new Container(
      height: 130.0,
      child: Card(
        color: Colors.white.withAlpha(150),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            ListTile(
              subtitle: Text("This syllabus is for year (2016/2017)"),
              leading: Icon(Icons.looks_3, color: Colors.redAccent),
              title: new RichText(
                text: TextSpan(
                  text: "Third Year Syllabus",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.wavy,
                      letterSpacing: 1.0,
                      color: Colors.black,
                      fontSize: 20.7),
                ),
              ),
            ),
            fStatet
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 10.0,
        title: Text('Syllabus'),
      ),
      body: Container(
        color: Colors.redAccent,
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            //new SizedBox(height: 40.0),

            downloading
                ? fybdownload()
//============================================ After condition =========================================================
                : fyadownload(),
//===================================================================== Second Year ==============================
            //new SizedBox(height: 40.0),

            downloading1
                ? sybdownload()
//============================================= After Condition ========================================================
                : syadownload(),
//================================================== Third Year =============================================================
            // new SizedBox(height: 40.0),

            downloading2
                ? tybdownload()

//=============================================== After Condition ======================================================
                : tyadownload()
          ],
        ),
      ),
    );
  }
}
