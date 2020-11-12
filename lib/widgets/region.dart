import 'package:Ludika/screens/exercice.dart';
import 'package:Ludika/screens/quiz1.dart';
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
    } else if (widget.matiere == "ecriture") {
      return Text(
        'Ecriture',
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
    } else if (widget.matiere == "ecriture") {
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
              child: Center(child: displayMatiere()),
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
                    )));
        /*Navigator.push(
            context, new MaterialPageRoute(builder: (context) => Quiz1()));*/
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
