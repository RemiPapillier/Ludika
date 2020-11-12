import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Planet extends StatefulWidget {
  Planet({this.grade});
  final int grade; //CP=1 CE1=2 CE2=3 CM1=4 CM2=5
  @override
  _PlanetState createState() => _PlanetState();
}

class _PlanetState extends State<Planet> {
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

  Text displayGrade() {
    if (widget.grade == 1) {
      return Text(
        'CP',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900, fontSize: 26, textStyle: myStyle()),
      );
    } else if (widget.grade == 2) {
      return Text(
        'CE1',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900, fontSize: 26, textStyle: myStyle()),
      );
    } else if (widget.grade == 3) {
      return Text(
        'CE2',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900, fontSize: 26, textStyle: myStyle()),
      );
    } else if (widget.grade == 4) {
      return Text(
        'CM1',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900, fontSize: 26, textStyle: myStyle()),
      );
    } else {
      return Text(
        'CM2',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900, fontSize: 26, textStyle: myStyle()),
      );
    }
  }

  AssetImage displayPlanet() {
    if (widget.grade == 1) {
      return AssetImage('assets/images/planeteCP.png');
    } else if (widget.grade == 2) {
      return AssetImage('assets/images/planeteCE1.png');
    } else if (widget.grade == 3) {
      return AssetImage('assets/images/planeteCE2.png');
    } else if (widget.grade == 4) {
      return AssetImage('assets/images/planeteCM1.png');
    } else {
      return AssetImage('assets/images/planeteCM2.png');
    }
  }

  double setSize(BuildContext context) {
    var _divwidth = MediaQuery.of(context).size.width;
    if (widget.grade == 1) {
      return _divwidth * 0.3;
    } else if (widget.grade == 2) {
      return _divwidth * 0.3;
    } else if (widget.grade == 3) {
      return _divwidth * 0.45;
    } else if (widget.grade == 4) {
      return _divwidth * 0.3;
    } else {
      return _divwidth * 0.3;
    }
  }

  void pushContext() {
    if (widget.grade == 1) {
      Navigator.pushNamed(context, '/cp');
    } else if (widget.grade == 2) {
      Navigator.pushNamed(context, '/ce1');
    } else if (widget.grade == 3) {
      Navigator.pushNamed(context, '/ce2');
    } else if (widget.grade == 4) {
      Navigator.pushNamed(context, '/cm1');
    } else {
      Navigator.pushNamed(context, '/cm2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      GestureDetector(
        child: Container(
          width: setSize(context),
          height: setSize(context),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: displayPlanet(), fit: BoxFit.scaleDown)),
          child: Center(child: displayGrade()),
        ),
        onTap: () {
          pushContext();
        },
      ),
    ]);
  }
}
