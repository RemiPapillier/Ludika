import 'package:Ludika/widgets/retour.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

//Stateless class
class InComing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //set max height and width of screen
    var _divheight = MediaQuery.of(context).size.height;
    var _divwidth = MediaQuery.of(context).size.width;

    //Return a little star icon for background
    Icon star() {
      return Icon(
        Icons.star,
        color: Colors.white,
        size: 8,
      );
    }

    //Return a stack generating random stars for the spatial background
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

    //return basic page with spatial background and message that inform the page isnt available yet
    return Scaffold(
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
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Cette page arrive bientôt",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bellota(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Positioned(bottom: 50, left: _divwidth * 0.33, child: Retour())
            ],
          )),
    );
  }
}
