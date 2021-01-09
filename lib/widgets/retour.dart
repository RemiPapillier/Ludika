import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

//Stateless class Retour
class Retour extends StatelessWidget {
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
    //return a clickable row containing Retour text and rocket image
    return InkWell(
      child: Row(
        children: [
          Transform.rotate(
            angle: 1.5 * math.pi,
            child: Container(
              height: _divwidth * 0.1,
              width: _divwidth * 0.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fusee.png'),
                      fit: BoxFit.contain)),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Retour',
            style: GoogleFonts.bellota(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                textStyle: myStyle()),
          )
        ],
      ),
      //Redirect to previous page on tap
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
