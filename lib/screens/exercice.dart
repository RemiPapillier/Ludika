import 'package:flutter/material.dart';

class Exercice extends StatefulWidget {
  Exercice({this.grade, this.matiere});
  final int grade;
  final String matiere;
  @override
  _ExerciceState createState() => _ExerciceState();
}

class _ExerciceState extends State<Exercice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[900],
        body: Container(
            child: Center(
          child: FloatingActionButton(
            child: Text('Back Home'),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        )));
  }
}
