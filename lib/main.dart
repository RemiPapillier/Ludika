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
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final AuthService _auth = AuthService();
  dynamic result = await _auth.signInAnon();

  if (result != null) {
    runApp(MyApp());
  } else {
    runApp(NoConnection());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
      },
    );
  }
}

class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Failed to get user"));
  }
}
