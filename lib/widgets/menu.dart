import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Statefull class with grade attribut and construsctor to get grade
class Menu extends StatefulWidget {
  Menu({this.grade});
  final int grade;
  @override
  _MenuState createState() => _MenuState();
}

//Widget class returning a clickable widget to go back to home
class _MenuState extends State<Menu> {
  //Return planet image corresponding to the current grade
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
    //define _divwidth as the maximum width of smartphone
    var _divwidth = MediaQuery.of(context).size.width;
    //return a clickable row containing Menu text and planet image
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
      //When clicked, bring to home page
      onTap: () {
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}
