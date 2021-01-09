import 'package:Ludika/widgets/region.dart';
import 'package:Ludika/widgets/retour.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Stateful class
class Ce2 extends StatefulWidget {
  @override
  _Ce2State createState() => _Ce2State();
}

class _Ce2State extends State<Ce2> {
  //Return a custom TextStyle
  TextStyle myStyle() {
    return TextStyle(
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 5.0,
          color: Colors.black,
          offset: Offset(2.0, 2.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var _divwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        //Set the background color
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                  Color(0xFFF8B755),
                  Color(0xFFF22B1D).withOpacity(0.9),
                ])),
            child: Stack(children: <Widget>[
              //Position the grade, return widget and differents hexagonal matiere on the page
              Positioned(
                  top: _divwidth * 0.28,
                  left: _divwidth * 0.62,
                  child: Text(
                    'CE2',
                    style: GoogleFonts.bellota(
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        textStyle: myStyle()),
                  )),
              Positioned(
                  top: _divwidth * 0.25,
                  left: _divwidth * 0.1,
                  child: Region(grade: 3, matiere: "conjugaison")),
              Positioned(
                  top: _divwidth * 0.25 + _divwidth * 0.225,
                  left: _divwidth * 0.48,
                  child: Region(grade: 3, matiere: "grammaire")),
              Positioned(
                  top: _divwidth * 0.25 + _divwidth * 0.45,
                  left: _divwidth * 0.1,
                  child: Region(grade: 3, matiere: "syllabe")),
              Positioned(
                  top: _divwidth * 0.25 + _divwidth * 0.225 + _divwidth * 0.45,
                  left: _divwidth * 0.48,
                  child: Region(grade: 3, matiere: "nombre")),
              Positioned(
                  top: _divwidth * 0.25 + _divwidth * 0.45 + _divwidth * 0.45,
                  left: _divwidth * 0.1,
                  child: Region(grade: 3, matiere: "calcul")),
              Positioned(
                  top: _divwidth * 0.25 +
                      _divwidth * 0.225 +
                      _divwidth * 0.45 +
                      _divwidth * 0.45,
                  left: _divwidth * 0.48,
                  child: Region(grade: 3, matiere: "heure")),
              Positioned(
                  top: _divwidth * 0.25 +
                      _divwidth * 0.225 +
                      _divwidth * 0.45 +
                      _divwidth * 0.45 +
                      _divwidth * 0.3,
                  left: _divwidth * 0.1,
                  child: Retour())
            ])));
  }
}
