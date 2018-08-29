import 'dart:async';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:simple_permissions/simple_permissions.dart';

class SecondPage extends StatefulWidget {
  static String tag = 'first_Page';
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool downloading = false;
  bool downloaded = false;
  bool downloading1 = false;
  bool downloaded1 = false;
  bool downloading2 = false;
  bool downloaded2 = false;
  var proSring = "";
  double value=0.0;
   double value2=0.0;
   double value3=0.0;
  bool fStatef = false;
  bool fStates = false;
  bool fStatet = false;
  String url;
  String fyesr =
      "http://mybscit.com/wp-content/uploads/2016/07/4.76-FYBScIT-Syllabus-2016-17.pdf";
  String syear =
      'http://mybscit.com/wp-content/uploads/2016/12/SYBSCIT-Syllabus-2017-2018.pdf';
  String tyear = 'http://archive.mu.ac.in/syllabus/4.129%20TYBSC%20IT.pdf';

  @override
  void initState() {
    super.initState();
    checkFile();
    requestPermission();
  }

  Future<void> checkFile() async {
    var dir = await getExternalStorageDirectory();
    final File file = File('${dir.path}/4.76-FYBScIT-Syllabus-2016-17.pdf');
    final File file1 = File('${dir.path}/SYBSCIT-Syllabus-2017-2018.pdf');
    final File file2 = File('${dir.path}/TYBSCIT-Syllabus-2017-2018.pdf');
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
  
    Dio dio = Dio();
    if (year == 1) {
      url = fyesr;
      
      try {
        var dir = await getExternalStorageDirectory();

        await dio.download(url, "${dir.path}/4.76-FYBScIT-Syllabus-2016-17.pdf",
            onProgress: (rec, total) {
          setState(() {
            downloading = true;
            proSring = ((rec / total) * 100).toStringAsFixed(0) + " %";
            value = ((rec / total) * 100);
            downloaded = true;
            checkFile();
          });
        });
      } catch (e) {
        setState(() {
          downloading = false;
          print(e);
        });
      }
      setState(() {
        downloading = false;
        proSring = 'Compleated';
        checkFile();
      });
    } else if (year == 2) {
      url = syear;
      try {
        var dir = await getExternalStorageDirectory();

        await dio.download(url, "${dir.path}/SYBSCIT-Syllabus-2017-2018.pdf",
            onProgress: (rec, total) {
          setState(() {
            downloading1 = true;
            proSring = ((rec / total) * 100).toStringAsFixed(0) + " %";
            value = ((rec / total) * 100);
            downloaded1 = true;
            checkFile();
          });
        });
      } catch (e) {
        setState(() {
          downloading1 = false;
          print(e);
        });
      }
      setState(() {
        downloading1 = false;
        proSring = 'Compleated';
        checkFile();
      });
    } else if (year == 3) {
      url = tyear;
      try {
        var dir = await getExternalStorageDirectory();

        await dio.download(url, "${dir.path}/TYBSCIT-Syllabus-2017-2018.pdf",
            onProgress: (rec, total) {
          setState(() {
            downloading2 = true;
            proSring = ((rec / total) * 100).toStringAsFixed(0) + " %";
            value2 = ((rec / total) * 100);
            downloaded2 = true;
            checkFile();
          });
        });
      } catch (e) {
        setState(() {
          downloading2 = false;
          print(e);
        });
      }
      setState(() {
        downloading2 = false;
        proSring = 'Compleated';
        checkFile();
      });
    }

    //return value;
  }

//=====================================================================================================
  Future<String> openFile(int year) async {
    var dir = await getExternalStorageDirectory();
    if (year == 1) {
      return await OpenFile
          .open("${dir.path}/4.76-FYBScIT-Syllabus-2016-17.pdf");
    } else if (year == 2) {
      return await OpenFile.open("${dir.path}/SYBSCIT-Syllabus-2017-2018.pdf");
    } else if (year == 3) {
      return await OpenFile.open("${dir.path}/TYBSCIT-Syllabus-2017-2018.pdf");
    }
  }

//===================================================================================================
  requestPermission() async {
    bool res = await SimplePermissions
        .requestPermission(Permission.WriteExternalStorage);
    print("permission request result is " + res.toString());
  }

//==================================================================================

//==========================================================================================
  Widget fybdownload() {
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
              value: value / 100,
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
              value: value / 100,
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
        elevation: 10.0,
        title: Text('Notes'),
      ),
      body: Container(
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
