import 'package:flutter/material.dart';
import 'package:Ludika/models/myUser.dart';
import 'package:Ludika/services/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Ludika/screens/home/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final AuthService _auth = AuthService();
  dynamic result = await _auth.signInAnon();

  if(result != null){
    runApp(MyApp());
  }
  else{
    runApp(NoConnection());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludika',
      home: Home(),
      routes: <String, WidgetBuilder> {

      },
    );
  }
}

class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Failed to get user")
    );
  }
}