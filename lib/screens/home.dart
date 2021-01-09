import 'package:flutter/material.dart';
import 'package:Ludika/services/authentication.dart';
import 'package:Ludika/models/myUser.dart';
import 'package:Ludika/widgets/planet.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  //get the current user
  static AuthService _auth = AuthService();
  MyUser currentUser = _auth.getCurrentUser();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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

    return Scaffold(
        //Background container
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
                //Positione and display planets
                Positioned(
                    top: _divheight * 0.12,
                    left: _divwidth * 0.6,
                    child: Planet(grade: 5)),
                Positioned(
                    top: _divheight * 0.16,
                    left: _divwidth * 0.12,
                    child: Planet(grade: 4)),
                Positioned(
                    top: _divheight * 0.3,
                    left: _divwidth * 0.4,
                    child: Planet(grade: 3)),
                Positioned(
                    top: _divheight * 0.45,
                    left: _divwidth * 0.08,
                    child: Planet(grade: 2)),
                Positioned(
                    top: _divheight * 0.55,
                    left: _divwidth * 0.65,
                    child: Planet(grade: 1)),
                //Display Ludo in the soucoup
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Transform.rotate(
                          angle: math.pi / 32,
                          child: Container(
                            width: _divwidth * 0.5,
                            height: _divwidth * 0.5,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/ludoSoucoupe.png'),
                                    fit: BoxFit.fitWidth)),
                          ),
                        )))
              ],
            )));
  }
}
