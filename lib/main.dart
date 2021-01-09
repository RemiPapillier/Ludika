import 'package:Ludika/screens/incoming.dart';
import 'package:flutter/material.dart';
import 'package:Ludika/services/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Ludika/screens/home.dart';
import 'package:Ludika/screens/cp.dart';
import 'package:Ludika/screens/ce1.dart';
import 'package:Ludika/screens/ce2.dart';
import 'package:Ludika/screens/cm1.dart';
import 'package:Ludika/screens/cm2.dart';
import 'package:flutter/services.dart';

void main() async {
  //Synchronize with Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Get current user
  final AuthService _auth = AuthService();
  dynamic resultUser = _auth.getCurrentUser();

  //If user exists run MyApp else create an account anonymously
  if (resultUser != null) {
    runApp(MyApp());
  } else {
    dynamic result = await _auth.signInAnon();
    //If authentication worked return MyApp else, run Failed page
    if (result != null) {
      runApp(MyApp());
    } else {
      runApp(NoConnection());
    }
  }
}

//Entry class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set orientation to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //return widget Materialapp with title, homepage and routes initialized
    return MaterialApp(
      title: 'Ludika',
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/home': (context) => Home(),
        '/cp': (context) => Cp(),
        '/ce1': (context) => Ce1(),
        '/ce2': (context) => Ce2(),
        '/cm1': (context) => Cm1(),
        '/cm2': (context) => Cm2(),
        '/incoming': (context) => InComing(),
      },
    );
  }
}

//Failed class
class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Failed to get user"));
  }
}
