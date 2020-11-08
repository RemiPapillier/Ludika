import 'package:flutter/material.dart';

class Exercice extends StatefulWidget {
  Exercice({this.grade, this.matiere});
  final int grade;
  final int matiere;
  @override
  _ExerciceState createState() => _ExerciceState();
}

class _ExerciceState extends State<Exercice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
