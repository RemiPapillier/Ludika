import 'package:flutter/material.dart';
import 'package:Ludika/services/authentication.dart';
import 'package:Ludika/models/myUser.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
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
    return Container(
      child: Text('Succeed ' + currentUser.uid),
    );
  }
}