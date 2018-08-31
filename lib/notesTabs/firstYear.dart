import 'dart:async';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:simple_permissions/simple_permissions.dart';

class NotesfPage extends StatefulWidget {
  static String tag = 'nfYear';
  @override
  _NotesfPageState createState() => _NotesfPageState();
}

class _NotesfPageState extends State<NotesfPage> {
  bool downloading = false;
  bool downloaded = false;
  
  bool downloading1 = false;
  bool downloaded1 = false;
  
  bool downloading2 = false;
  bool downloaded2 = false;
  
  bool downloading3 = false;
  bool downloaded3 = false;
  
  bool downloading4 = false;
  bool downloaded4 = false;
  
  var proSring = "";
  double value=0.0;
  double value2=0.0;
  double value3=0.0;
  double value4=0.0;
  double value5=0.0;

  bool fStateip = false;
  bool fStatede = false;
  bool fStateos = false;
bool fStatedm = false;
bool fStatecs = false;

  String url;
  String ip =
      "https://drive.google.com/uc?export=download&id=1SXzpiA1ayfMpf-FMVQrZWYaE7GHN9cKP";
  String de =
      'https://drive.google.com/uc?export=download&id=1JhlXtqR5RFLPDSJsaSvF_aEWs9VHQ3bc';
  String os = 'https://drive.google.com/uc?export=download&id=1KrqNSby6Ihojhb6kz44GMgZorUnlnFIT';
String dm = 'https://drive.google.com/uc?export=download&id=1vIVD_Y5S9cj8flZyq0lSwJrC1tbyyyyv';
String cs = 'https://drive.google.com/uc?export=download&id=1TbPDhZby-lxygdqnw6XYuIgjCVsfuLzk';
  @override
  void initState() {
    super.initState();
    checkFile();
  }

  Future<void> checkFile() async {
    final dir=await getExternalStorageDirectory();
    final File file = File('${dir.path}/Imperative_Programming_notes.pdf');
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

//===================================================================================================
  Future<void> downloadFile(int subject) async {
 final dir = await getExternalStorageDirectory();
    Dio dio = Dio();
    if (subject == 1) {
      url =ip;
      
      try {
        

        await dio.download(url, "${dir.path}/Imperative_Programming_notes.pdf",
                
            onProgress: (rec, total) {
          setState(() {
            downloading = true;
            proSring = ((rec / 12132961) * 100).toStringAsFixed(0) + " %";
            value = ((rec / 12132961) * 100);
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
    } else if (subject == 2) {
      url = de;
      try {
        

        await dio.download(url, "${dir.path}/Digital-Electronics-Notes.pdf",
            onProgress: (rec, total) {
          setState(() {
            downloading1 = true;
            proSring = ((rec / 9476463) * 100).toStringAsFixed(0) + " %";
            value = ((rec / 9476463) * 100);
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
    } else if (subject == 3) {
      url = os;
      try {
        

        await dio.download(url, "${dir.path}/Operating-System-Notes.pdf",
            onProgress: (rec, total) {
          setState(() {
            downloading2 = true;
            proSring = ((rec / 6556637) * 100).toStringAsFixed(0) + " %";
            value2 = ((rec / 6556637) * 100);
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
    }else if (subject == 4) {
      url = os;
      try {
        

        await dio.download(url, "${dir.path}/Discrete-Mathematics-Notes.pdf",
            onProgress: (rec, total) {
          setState(() {
            downloading3 = true;
            proSring = ((rec / 16126000) * 100).toStringAsFixed(0) + " %";
            value3 = ((rec / 16126000) * 100);
            downloaded3 = true;
            checkFile();
          });
        });
      } catch (e) {
        setState(() {
          downloading3 = false;
          print(e);
        });
      }
      setState(() {
        downloading3 = false;
        proSring = 'Compleated';
        checkFile();
      });
    }
    else if (subject == 5) {
      url = cs;
      try {
        

        await dio.download(url, "${dir.path}/Communication-Skills-Notes.pdf",
              
              
            onProgress: (rec, total) {
              
          setState(() {
            downloading4 = true;
            proSring = ((rec /18713057 ) * 100).toStringAsFixed(0) + " %";
            value4 = ((rec / 18713057 ) * 100);
            downloaded4 = true;
            checkFile();
          });
        });
      } catch (e) {
        setState(() {
          downloading4 = false;
          print(e);
        });
      }
      setState(() {
        downloading4 = false;
        proSring = 'Compleated';
        checkFile();
      });
    }

    //return value;
  }

//=====================================================================================================
  Future<String> openFile(int subject) async {
    final dir=await getExternalStorageDirectory();
    if (subject == 1) {
      return await OpenFile
          .open("${dir.path}/Imperative_Programming_notes.pdf");
    } else if (subject == 2) {
      return await OpenFile.open("${dir.path}/Digital-Electronics-Notes.pdf");
    } else if (subject == 3) {
      return await OpenFile.open("${dir.path}/Operating-System-Notes.pdf");
    }
    else if (subject == 4) {
      return await OpenFile.open("${dir.path}/Discrete-Mathematics-Notes.pdf");
    }
    else if (subject == 5) {
      return await OpenFile.open("${dir.path}/Communication-Skills-Notes.pdf");
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
  Widget ipbdownload() {
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
              leading: Icon(Icons.book,  size: 59.0, color: Colors.redAccent),
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
                    onPressed: () => downloadFile(1),
                  ),
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
              leading: Icon(Icons.book, size: 59.0,   color: Colors.redAccent),
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
              leading: Icon(Icons.book, size: 59.0,color: Colors.redAccent),
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
              leading: Icon(Icons.book, size:59.0,color: Colors.redAccent),
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
              leading: Icon(Icons.book,size: 59.0,     color: Colors.redAccent),
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
                    text: "Semister I"
                ),
        ),
            downloading
                ? ipbdownload()
                : ipadownload(),

            //new SizedBox(height: 40.0),

            downloading1
                ? debdownload()
                : deadownload(),
           // new SizedBox(height: 40.0),

            downloading2
                ? osbdownload()
                : osadownload(),

            downloading3
            ?dmbdownload()
            :dmadownload(), 
             downloading4
            ?csbdownload()
            :csadownload(),
             new RichText(
                text: TextSpan(
                    style: TextStyle(
                      letterSpacing: 5.0,
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    text: "Semister II"
                ),
        ),   
          ],
        ),
      ),
    );
  }
}
