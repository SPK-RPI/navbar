import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart' show rootBundle;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<String> userDetails;

  @override
  Widget build(BuildContext context) {
    final logo = new CircleAvatar(
      backgroundColor: Colors.white,
      maxRadius: 150.0,
      child: new Image(
        image: new AssetImage('assets/information.png'),
      ),
    );

    /*final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );*/

    /*final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );*/
//========================================== google auth =========================================
    Future<FirebaseUser> _signinGoogle() async {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final FirebaseUser user = await _auth.signInWithGoogle(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      assert(user.email != null);
      assert(user.displayName != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      return user;
    }

    //======================================================================================
    final facebook = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          colorBrightness: Brightness.light,
          elevation: 10.0,
          minWidth: 200.0,
          height: 42.0,
          onPressed: () => Navigator.of(context).pushReplacementNamed(HomePage.tag),
          color: Colors.blueAccent,
          child: Text('Facebook', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
//==========================================================================================================
/*static var httpClient = new HttpClient();
Future<File> _downloadFile(String url, String filename) async {
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  var bytes = await consolidateHttpClientResponseBytes(response);
  String dir = (await getApplicationDocumentsDirectory()).path;
  File file = new File('$dir/$filename');
  await file.writeAsBytes(bytes);
  return file;
}*/
//=========================================================================
    final gPlus = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            _signinGoogle().then((FirebaseUser user) {
              print(user);

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => new HomePage(user: user),
                  ));
            });
          },
          color: Colors.redAccent,
          child: Text('Google Plus', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final yourbscit = new Center(
        child: Text('YourBscIT',
            style: TextStyle(
                letterSpacing: 8.0,
                fontFamily: 'assets/fonts/Spirax-Regular.ttf',
                color: Colors.black54,
                fontSize: 40.0)));

    final orlebel = new Center(
        child: Text('OR',
            style: TextStyle(color: Colors.black54, fontSize: 30.0)));

    return Scaffold(
      //backgroundColor: Colors.indigoAccent,
      body: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.lerp(
                Radius.circular(10.0), Radius.elliptical(19.1, 121.1), 12.8)),
            color:  Color.fromRGBO(180, 202, 237,0.9)),
        child: ListView(
          //shrinkWrap: true,
          padding: EdgeInsets.only(left: 50.0, right: 50.0),
          children: <Widget>[
            logo,
            //SizedBox(height: 200.0),
            //email,
            SizedBox(height: 8.0),
            yourbscit,
            SizedBox(height: 24.0),
            facebook,
            //forgotLabel,

            SizedBox(height: 24.0),
            orlebel,
            gPlus,
          ],
        ),
      ),
    );
  }
}
