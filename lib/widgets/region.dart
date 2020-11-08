import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Region extends StatefulWidget {
  Region({this.matiere});
  final int matiere; //maths=1 conugaison=2...
  @override
  _RegionState createState() => _RegionState();
}

class _RegionState extends State<Region> {
  Text displayMatiere() {
    if (widget.matiere == 1) {
      return Text(
        'Conjugaison',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(color: Colors.white)),
      );
    } else if (widget.matiere == 2) {
      return Text(
        'Ecriture',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(color: Colors.white)),
      );
    } else if (widget.matiere == 3) {
      return Text(
        'Syllabes',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(color: Colors.white)),
      );
    } else if (widget.matiere == 4) {
      return Text(
        'Nombres',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(color: Colors.white)),
      );
    } else if (widget.matiere == 5) {
      return Text(
        'Calcul',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(color: Colors.white)),
      );
    } else {
      return Text(
        'Heure',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(color: Colors.white)),
      );
    }
  }

  AssetImage displayHexBackground() {
    if (widget.matiere == 1) {
      return AssetImage('assets/images/hexForet.png');
    } else if (widget.matiere == 2) {
      return AssetImage('assets/images/hexDesert.png');
    } else if (widget.matiere == 3) {
      return AssetImage('assets/images/hexMontagne.png');
    } else if (widget.matiere == 4) {
      return AssetImage('assets/images/hexPrairie.png');
    } else if (widget.matiere == 5) {
      return AssetImage('assets/images/hexPyramide.png');
    } else {
      return AssetImage('assets/images/hexVolcan.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    var _divwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: ClipPath(
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
      onTap: () {
        Navigator.pushNamed(context, '/home');
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
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.75, size.height * 0.95);
    path.lineTo(size.width * 0.25, size.height * 0.95);
    path.lineTo(0, size.height * 0.5);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
