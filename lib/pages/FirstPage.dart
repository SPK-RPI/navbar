import 'dart:async';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syllabus'),
      ),
      body: Container(
          color: Colors.blue,
       
       padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              downloading
                  ? new Container(
                      height: 120.0,
                      width: 500.0,
                      child: Card(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        elevation: 10.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    )
//============================================ After condition =========================================================
                  : Container(
                      height: 120.0,
                      width: 500.0,
                      child: Card(
                        color:Color.fromRGBO(255, 255, 255, 0.6),
                        elevation: 10.0,
                        // color: Colors.black12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text("First Year Syllabus"),
                            fStatef
                                ? new RaisedButton(
                                    onPressed: () => openFile(1),
                                    child: Text("Open"),
                                  )
                                : new RaisedButton(
                                    onPressed: () => downloadFile(1),
                                    child: Text("Download"),
                                  ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ),
//===================================================================== Second Year ==============================
              new SizedBox(height: 40.0),
              downloading1
                  ? new Container(
                      height: 120.0,
                      width: 500.0,

                      child: Card(
                        color:Color.fromRGBO(255, 255, 255, 0.6),
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
                    )
//============================================= After Condition ========================================================
                  : Container(
                      height: 120.0,
                      width: 500.0,
                      child: Card(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        elevation: 10.0,
                        // color: Colors.black12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text("Second Year Syllabus"),
                            fStates
                                ? new RaisedButton(
                                    onPressed: () => openFile(2),
                                    child: Text("Open"),
                                  )
                                : new RaisedButton(
                                    onPressed: () => downloadFile(2),
                                    child: Text("Download"),
                                  ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ),
//================================================== Third Year =============================================================
              new SizedBox(height: 40.0),
              downloading2
                  ? new Container(
                      height: 120.0,
                      width: 500.0,
                      child: Card(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        elevation: 10.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //SizedBox(height: 20.0),
                            Text("Downloading...  $proSring"),
                            new SizedBox(height: 90.0),
                            new LinearProgressIndicator(
                              value: value / 100,
                              backgroundColor: Colors.white,

                              //backgroundColor: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    )

//=============================================== After Condition ======================================================
                  : Container(
                      height: 120.0,
                      width: 500.0,
                      child: Card(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        elevation: 10.0,
                        // color: Colors.black12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            new RichText(
                              text: TextSpan(
                                text: "Third Year Syllabus",
                                style: TextStyle(
                                  color:Colors.white,
                                   fontSize: 20.7
                                ),
                              ),
                            ),
                            new SizedBox(height: 20.0),
                            fStatet
                                ? new RaisedButton(
                                    elevation: 10.0,
                                    splashColor:
                                        Color.fromRGBO(247, 34, 109, 1.0),
                                    onPressed: () => openFile(3),
                                    child: Text("Open"),
                                  )
                                : new RaisedButton(
                                    onPressed: () => downloadFile(3),
                                    child: Text("Download"),
                                  ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
