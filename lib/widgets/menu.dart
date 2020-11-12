import 'package:Ludika/services/conjugaison.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class Menu extends StatefulWidget {
  Menu({this.grade});
  final int grade;
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
    return InkWell(
      child: Row(children: [
        Text(
          'Menu',
          style: GoogleFonts.bellota(
              fontWeight: FontWeight.w700, fontSize: 22, textStyle: myStyle()),
        ),
        SizedBox(
          width: 7,
        ),
        Container(
          width: _divwidth * 0.1,
          height: _divwidth * 0.1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: displayPlanet(), fit: BoxFit.scaleDown)),
        ),
      ]),
      onTap: () {
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}
