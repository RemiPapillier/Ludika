import 'package:Ludika/data/calcul.dart';
import 'package:Ludika/data/conjugaison.dart';
import 'package:Ludika/data/grammaire.dart';
import 'package:Ludika/data/heure.dart';
import 'package:Ludika/data/nombre.dart';
import 'package:Ludika/data/syllabe.dart';
import 'package:Ludika/models/myUser.dart';
import 'package:Ludika/screens/exercice.dart';
import 'package:Ludika/services/authentication.dart';
import 'package:Ludika/services/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Region extends StatefulWidget {
  Region({this.grade, this.matiere});
  final int grade;
  final String matiere;
  @override
  _RegionState createState() => _RegionState();
}

class _RegionState extends State<Region> {
  static AuthService _auth = AuthService();
  MyUser currentUser = _auth.getCurrentUser();
  bool show;

  Quiz getQuiz() {
    if (widget.matiere == "conjugaison") {
      return getQuizConj(widget.grade);
    } else if (widget.matiere == "grammaire") {
      return getQuizGram(widget.grade);
    } else if (widget.matiere == "syllabe") {
      return getQuizSyl(widget.grade);
    } else if (widget.matiere == "nombre") {
      return getQuizNomb(widget.grade);
    } else if (widget.matiere == "calcul") {
      return getQuizCalcul(widget.grade);
    } else {
      return getQuizHeure(widget.grade);
    }
  }

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

  Text displayMatiere() {
    if (widget.matiere == "conjugaison") {
      return Text('Conjugaison',
          style: GoogleFonts.bellota(
              fontWeight: FontWeight.w900, fontSize: 22, textStyle: myStyle()));
    } else if (widget.matiere == "grammaire") {
      return Text(
        'Grammaire',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900, fontSize: 22, textStyle: myStyle()),
      );
    } else if (widget.matiere == "syllabe") {
      return Text(
        'Syllabes',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900, fontSize: 22, textStyle: myStyle()),
      );
    } else if (widget.matiere == "nombre") {
      return Text(
        'Nombres',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900, fontSize: 22, textStyle: myStyle()),
      );
    } else if (widget.matiere == "calcul") {
      return Text(
        'Calcul',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900, fontSize: 22, textStyle: myStyle()),
      );
    } else {
      return Text(
        'Heure',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900, fontSize: 22, textStyle: myStyle()),
      );
    }
  }

  AssetImage displayHexBackground() {
    if (widget.matiere == "conjugaison") {
      return AssetImage('assets/images/hexPalmier.png');
    } else if (widget.matiere == "grammaire") {
      return AssetImage('assets/images/hexDesert.png');
    } else if (widget.matiere == "syllabe") {
      return AssetImage('assets/images/hexMontagne.png');
    } else if (widget.matiere == "nombre") {
      return AssetImage('assets/images/hexPrairie.png');
    } else if (widget.matiere == "calcul") {
      return AssetImage('assets/images/hexPyramide.png');
    } else {
      return AssetImage('assets/images/hexVolcan.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    var _divwidth = MediaQuery.of(context).size.width;

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

    getBadgeStatus(String name) async {
      dynamic resultant = DatabaseService(uid: currentUser.uid).getUserBadge();
      resultant.then((querySnapshot) {
        setState(() {
          show = querySnapshot.data()[name];
        });
      });
    }

    getBadgeStatus(badgeName());

    return GestureDetector(
      child: Stack(
        children: [
          ClipPath(
            child: Container(
              width: _divwidth * 0.45,
              height: _divwidth * 0.45,
              color: Colors.white.withOpacity(0.6),
            ),
            clipper: HexagonClipperBack(),
          ),
          ClipPath(
            child: Container(
              width: _divwidth * 0.45,
              height: _divwidth * 0.45,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: displayHexBackground(), fit: BoxFit.cover)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    displayMatiere(),
                    Visibility(
                      visible: show,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Container(
                          height: _divwidth * 0.1,
                          width: _divwidth * 0.1,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/badge.png'),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                    )
                  ]),
            ),
            clipper: HexagonClipper(),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Exercice(
                    grade: widget.grade,
                    matiere: widget.matiere,
                    quiz: getQuiz())));
      },
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.05);

    path.lineTo(size.width * 0.75, size.height * 0.05);
    path.lineTo(size.width * 0.99, size.height * 0.5);
    path.lineTo(size.width * 0.75, size.height * 0.95);
    path.lineTo(size.width * 0.25, size.height * 0.95);
    path.lineTo(size.width * 0.01, size.height * 0.5);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}

class HexagonClipperBack extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.24, size.height * 0.04);

    path.lineTo(size.width * 0.76, size.height * 0.04);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.76, size.height * 0.96);
    path.lineTo(size.width * 0.24, size.height * 0.96);
    path.lineTo(0, size.height * 0.5);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
