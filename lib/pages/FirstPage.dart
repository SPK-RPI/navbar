import 'dart:async';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:simple_permissions/simple_permissions.dart';

class FirstPage extends StatefulWidget {
  static String tag = 'first_Page';
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool downloading = false;
  bool downloaded = false;
  bool downloading1 = false;
  bool downloaded1 = false;
  bool downloading2 = false;
  bool downloaded2 = false;
  var proSring = "";
  double value = 0.0;
  bool fStatef = false;
  bool fStates = false;
  bool fStatet = false;
  String url;
  String fyesr =
      'http://mybscit.com/wp-content/uploads/2016/07/4.76-FYBScIT-Syllabus-2016-17.pdf';
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
            value = ((rec / total) * 100);
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
      height: 120.0,
      width: 500.0,
      child: Card(
        margin: EdgeInsets.all(10.0),
        color: Color.fromRGBO(255, 255, 255, 0.8),
        elevation: 10.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  text: "Downloading : $proSring"),
            ),

            new Column(
              children: <Widget>[
                new CircularProgressIndicator(
                  value: value / 100,
                ),
              ],
            ),

            //SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget fyadownload() {
    return new Container(
      height: 120.0,
      width: 500.0,
      child: Card(
        margin: EdgeInsets.all(10.0),
        color: Color.fromRGBO(255, 255, 255, 0.8),
        elevation: 10.0,
        // color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50.0,
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
                  shape: StadiumBorder(
                    side:BorderSide(
                      style:BorderStyle.solid
                    )
                  ),
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
      height: 120.0,
      width: 500.0,
      child: Card(
        color: Color.fromRGBO(255, 255, 255, 0.6),
        elevation: 10.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: 20.0),
            Text("Downloading : $proSring"),
            new LinearProgressIndicator(
              value: value / 100,
              //backgroundColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget syadownload() {
    return new Container(
      height: 120.0,
      width: 500.0,
      child: Card(
        margin: EdgeInsets.all(10.0),
        color: Color.fromRGBO(255, 255, 255, 0.8),
        elevation: 10.0,
        // color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            fStates
                ? new RaisedButton(
                    elevation: 10.0,
                    color: Colors.greenAccent,
                    onPressed: () => openFile(2),
                    child: Text("Open"),
                  )
                : new RaisedButton(
                    elevation: 10.0,
                    color: Colors.blueAccent,
                    onPressed: () => downloadFile(2),
                    child: Text("Download"),
                  ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget tybdownload() {
    return new Container(
      height: 120.0,
      width: 500.0,
      child: Card(
        margin: EdgeInsets.all(10.0),
        color: Color.fromRGBO(255, 255, 255, 0.6),
        elevation: 10.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //SizedBox(height: 20.0),
            Text.rich(
              TextSpan(
                text: "Downloading : $proSring",
              ),
            ),
            new SizedBox(height: 90.0),
            new LinearProgressIndicator(
              value: value / 100,
              backgroundColor: Colors.white,

              //backgroundColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget tyadownload() {
    return Container(
      height: 120.0,
      width: 500.0,
      child: Card(
        margin: EdgeInsets.all(10.0),
        color: Color.fromRGBO(255, 255, 255, 0.8),
        elevation: 10.0,
        // color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //new SizedBox(height: 20.0),
            fStatet
                ? new RaisedButton(
                    color: Colors.greenAccent,
                    elevation: 10.0,
                    splashColor: Color.fromRGBO(247, 34, 109, 1.0),
                    onPressed: () => openFile(3),
                    child: Text("Open"),
                  )
                : new RaisedButton(
                    color: Colors.blueAccent,
                    onPressed: () => downloadFile(3),
                    child: Text("Download"),
                  ),
            SizedBox(height: 20.0),
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
        title: Text('Syllabus'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Card(
          margin: EdgeInsets.all(8.0),
          shape: Material().shape,
          color: Color.fromRGBO(255, 255, 255, 0.6),
          elevation: 8.0,
          child: ListView(
            children: <Widget>[
              new SizedBox(height: 40.0),
              new RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "First Year Syllabus",
                  style: TextStyle(
                      decorationStyle: TextDecorationStyle.wavy,
                      letterSpacing: 5.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 20.7),
                ),
              ),
              downloading
                  ? fybdownload()
//============================================ After condition =========================================================
                  : fyadownload(),
//===================================================================== Second Year ==============================
              new SizedBox(height: 40.0),
              new RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Second Year Syllabus",
                  style: TextStyle(
                      decorationStyle: TextDecorationStyle.wavy,
                      letterSpacing: 5.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 20.7),
                ),
              ),
              downloading1
                  ? sybdownload()
//============================================= After Condition ========================================================
                  : syadownload(),
//================================================== Third Year =============================================================
              new SizedBox(height: 40.0),
              new RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Third Year Syllabus",
                  style: TextStyle(
                      decorationStyle: TextDecorationStyle.wavy,
                      letterSpacing: 5.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 20.7),
                ),
              ),
              downloading2
                  ? tybdownload()

//=============================================== After Condition ======================================================
                  : tyadownload()
            ],
          ),
        ),
      ),
    );
  }
}
