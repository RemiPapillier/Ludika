import 'package:Ludika/widgets/region.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ce1 extends StatefulWidget {
  @override
  _Ce1State createState() => _Ce1State();
}

class _Ce1State extends State<Ce1> {
  @override
  Widget build(BuildContext context) {
    var _divwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color(0xFF009B9A),
                  Color(0xFF52F207),
                  Color(0xFF009B9A)
                ])),
            child: Stack(children: <Widget>[
              Positioned(
                  top: _divwidth * 0.28,
                  left: _divwidth * 0.62,
                  child: Text(
                    'CE1',
                    style: GoogleFonts.bellota(
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        textStyle: TextStyle(color: Colors.white)),
                  )),
              Positioned(
                  top: _divwidth * 0.25,
                  left: _divwidth * 0.1,
                  child: Region(grade: 2, matiere: "conjugaison")),
              Positioned(
                  top: _divwidth * 0.25 + _divwidth * 0.225,
                  left: _divwidth * 0.48,
                  child: Region(grade: 2, matiere: "ecriture")),
              Positioned(
                  top: _divwidth * 0.25 + _divwidth * 0.45,
                  left: _divwidth * 0.1,
                  child: Region(grade: 2, matiere: "syllabe")),
              Positioned(
                  top: _divwidth * 0.25 + _divwidth * 0.225 + _divwidth * 0.45,
                  left: _divwidth * 0.48,
                  child: Region(grade: 2, matiere: "nombre")),
              Positioned(
                  top: _divwidth * 0.25 + _divwidth * 0.45 + _divwidth * 0.45,
                  left: _divwidth * 0.1,
                  child: Region(grade: 2, matiere: "calcul")),
              Positioned(
                  top: _divwidth * 0.25 +
                      _divwidth * 0.225 +
                      _divwidth * 0.45 +
                      _divwidth * 0.45,
                  left: _divwidth * 0.48,
                  child: Region(grade: 2, matiere: "heure")),
              Positioned(
                  top: _divwidth * 0.25 +
                      _divwidth * 0.225 +
                      _divwidth * 0.45 +
                      _divwidth * 0.45 +
                      _divwidth * 0.35,
                  left: _divwidth * 0.30,
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ))
            ])));
  }
}
