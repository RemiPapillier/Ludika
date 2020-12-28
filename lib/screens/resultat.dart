import 'package:Ludika/models/myUser.dart';
import 'package:Ludika/services/authentication.dart';
import 'package:Ludika/services/database.dart';
import 'package:flutter/material.dart';
import 'package:Ludika/widgets/menu.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class Resultat extends StatefulWidget {
  Resultat({this.score, this.grade, this.matiere});
  final int score;
  final int grade;
  final String matiere;
  @override
  _ResultatState createState() => _ResultatState();
}

class _ResultatState extends State<Resultat> {
  static AuthService _auth = AuthService();
  MyUser currentUser = _auth.getCurrentUser();

  @override
  Widget build(BuildContext context) {
    var _divheight = MediaQuery.of(context).size.height;
    var _divwidth = MediaQuery.of(context).size.width;

    Icon star() {
      return Icon(
        Icons.star,
        color: Colors.white,
        size: 8,
      );
    }

    String badgeName() {
      if (widget.grade == 1) {
        return "cp" + widget.matiere;
      } else if (widget.grade == 2) {
        return "ce1" + widget.matiere;
      } else if (widget.grade == 3) {
        return "ce2" + widget.matiere;
      } else if (widget.grade == 4) {
        return "cm1" + widget.matiere;
      } else {
        return "cm2" + widget.matiere;
      }
    }

    String displayMessage() {
      if (widget.score >= 8) {
        DatabaseService(uid: currentUser.uid).giveUserBadge(badgeName());
        return "Bravo! Tu as bien mérité ton badge";
      } else if (widget.score < 8 && widget.score >= 5) {
        return "Presque, il te faut au moins 8/10 pour obtenir un badge!";
      } else {
        return "Dommage, tu feras mieux la prochaine fois!";
      }
    }

    Stack generateStars() {
      var rng = math.Random();
      List<List<int>> coord = [];
      for (var i = 0; i < 50; i++) {
        var w = rng.nextInt(_divwidth.round());
        var h = rng.nextInt(_divheight.round());
        coord.add([w, h]);
      }
      return Stack(
          children: List<Widget>.generate(coord.length, (int index) {
        return Positioned(
            child: star(),
            left: coord[index][0].toDouble(),
            top: coord[index][1].toDouble());
      }));
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                Color(0xFF28196D).withOpacity(0.9),
                Color(0xFF04042C)
              ])),
          child: Stack(
            children: <Widget>[
              generateStars(),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: _divwidth * 0.2, left: 30, right: 30),
                  child: Text(
                    displayMessage(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bellota(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: _divwidth * 0.3),
                  child: Container(
                    width: _divwidth * 0.7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/soucoupeResultat.png'),
                            fit: BoxFit.scaleDown)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: _divwidth * 0.5),
                        child: Text(
                          widget.score.toString() + " / 10",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bellota(
                              fontWeight: FontWeight.w900,
                              fontSize: 42,
                              textStyle: TextStyle(
                                color: Colors.greenAccent[400],
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.greenAccent[700],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Menu(grade: widget.grade),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
