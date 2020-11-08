import 'package:flutter/material.dart';
import 'package:Ludika/services/authentication.dart';
import 'package:Ludika/models/myUser.dart';
import 'package:Ludika/widgets/planet.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static AuthService _auth = AuthService();
  MyUser currentUser = _auth.getCurrentUser();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //child: Text('Succeed ' + currentUser.uid),
        backgroundColor: Colors.indigo[900],
        body: Stack(
          children: <Widget>[
            Positioned(top: 110, left: 20, child: Planet(grade: 5)),
            Positioned(top: 250, left: 120, child: Planet(grade: 4)),
            Positioned(top: 150, left: 220, child: Planet(grade: 3)),
            Positioned(top: 350, left: 10, child: Planet(grade: 2)),
            Positioned(top: 400, left: 220, child: Planet(grade: 1)),
          ],
        ));
  }
}
