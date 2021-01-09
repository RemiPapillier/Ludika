import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Statefull class with grade attribut and construsctor to get grade
class Planet extends StatefulWidget {
  Planet({this.grade});
  final int grade; //CP=1 CE1=2 CE2=3 CM1=4 CM2=5
  @override
  _PlanetState createState() => _PlanetState();
}

//Widget class returning a clickable planet that redirect to the appropriate grade
class _PlanetState extends State<Planet> {
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

  //Return the text to display taking in function of grade attribute
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

  //Return the appropriate image in function of grade attribute
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

  //Return a double corresponding to the size of each planet
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

  //Redirect to the appropriate page in function of grade attribute
  void pushContext() {
    if (widget.grade == 1) {
      Navigator.pushNamed(context, '/cp');
    } else if (widget.grade == 2) {
      Navigator.pushNamed(context, '/incoming');
    } else if (widget.grade == 3) {
      Navigator.pushNamed(context, '/incoming');
    } else if (widget.grade == 4) {
      Navigator.pushNamed(context, '/incoming');
    } else {
      Navigator.pushNamed(context, '/incoming');
    }
  }

  @override
  Widget build(BuildContext context) {
    //Clickable Stack containing the planet image, the text grade and redirecting to the appropriate grade
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
