import 'dart:async';

import 'package:Ludika/services/conjugaison.dart';
import 'package:Ludika/widgets/menu.dart';
import 'package:Ludika/widgets/retour.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimalQuiz {
  var images = ["danse", "habit", "photo", "lisLivre"];

  var questions = [
    "This animal is a carnivorous reptile.",
    "_________ like to chase mice and birds.",
    "Give a _________ a bone and he will find his way home",
    "A nocturnal animal with some really big eyes",
  ];

  var choices = [
    ["Cat", "Sheep", "Alligator"],
    ["Cat", "Snail", "Slug"],
    ["Mouse", "Dog", "Elephant"],
    ["Spider", "Snake", "Hawk"]
  ];

  var correctAnswers = ["Alligator", "Cat", "Dog", "Hawk"];
}

class Exercice extends StatefulWidget {
  Exercice({this.grade, this.matiere});
  final int grade;
  final String matiere;
  @override
  _ExerciceState createState() => _ExerciceState();
}

class _ExerciceState extends State<Exercice> {
  var finalScore = 0;
  var questionNumber = 0;
  var quiz = new AnimalQuiz();

  Color colorToShow = Colors.indigoAccent;
  Color correct = Colors.green;
  Color wrong = Colors.red;
  bool disableAnswer = false;

  Map<String, Color> btncolor = {
    "0": Colors.indigoAccent,
    "1": Colors.indigoAccent,
    "2": Colors.indigoAccent,
  };

  AssetImage displayBackground() {
    if (widget.matiere == "conjugaison") {
      return AssetImage('assets/images/backPalmier.jpg');
    } else if (widget.matiere == "ecriture") {
      return AssetImage('assets/images/backDesert.jpg');
    } else if (widget.matiere == "syllabe") {
      return AssetImage('assets/images/backMontagne.jpg');
    } else if (widget.matiere == "nombre") {
      return AssetImage('assets/images/backPrairie.jpg');
    } else if (widget.matiere == "calcul") {
      return AssetImage('assets/images/backPyramide.jpg');
    } else {
      return AssetImage('assets/images/backVolcan.jpg');
    }
  }

  /*void resetQuiz() {
    setState(() {
      //Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }*/
  void checkAnswer(int nb) {
    if (quiz.choices[questionNumber][nb] ==
        quiz.correctAnswers[questionNumber]) {
      debugPrint("Correct");
      finalScore++;
      colorToShow = correct;
    } else {
      debugPrint("Wrong");
      colorToShow = wrong;
      Timer(Duration(milliseconds: 500), () {
        displayCorrectAnswer();
      });
    }
    setState(() {
      btncolor[nb.toString()] = colorToShow;
      disableAnswer = true;
      Timer(Duration(seconds: 3), () {
        updateQuestion();
      });
    });
  }

  void displayCorrectAnswer() {
    var k;
    for (var i = 0; i < 3; i++) {
      if (quiz.choices[questionNumber][i] ==
          quiz.correctAnswers[questionNumber]) {
        k = i;
      }
    }
    setState(() {
      btncolor[k.toString()] = correct;
    });
  }

  Widget answerButton(int nb) {
    return MaterialButton(
      color: btncolor[nb.toString()],
      onPressed: () {
        checkAnswer(nb);
      },
      child: new Text(
        quiz.choices[questionNumber][nb],
        style: new TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.pushNamed(context, '/home');
      } else {
        questionNumber++;
      }
      btncolor["0"] = Colors.indigoAccent;
      btncolor["1"] = Colors.indigoAccent;
      btncolor["2"] = Colors.indigoAccent;
      disableAnswer = false;
    });
  }

  Text displayMatiere() {
    if (widget.matiere == "conjugaison") {
      return Text(
        'Conjugaison',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(
              color: Colors.black,
            )),
      );
    } else if (widget.matiere == "ecriture") {
      return Text(
        'Ecriture',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(color: Colors.black)),
      );
    } else if (widget.matiere == "syllabe") {
      return Text(
        'Syllabes',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(color: Colors.black)),
      );
    } else if (widget.matiere == "nombre") {
      return Text(
        'Nombres',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(color: Colors.black)),
      );
    } else if (widget.matiere == "calcul") {
      return Text(
        'Calcul',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(color: Colors.black)),
      );
    } else {
      return Text(
        'Heure',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            textStyle: TextStyle(color: Colors.black)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var _divheight = MediaQuery.of(context).size.height;
    var _divwidth = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: Container(
          height: _divheight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: displayBackground(),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.color),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: _divheight * 0.07),
            child: Stack(
              children: [
                Positioned(
                    top: _divwidth * 0.25 - 7,
                    left: _divwidth * 0.05,
                    child: Column(children: [
                      Center(
                        child: Container(
                          width: _divwidth * 0.9,
                          constraints:
                              BoxConstraints(minHeight: _divheight * 0.68),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                displayMatiere(),
                                Text(
                                  quiz.questions[questionNumber],
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/exo/${quiz.images[questionNumber]}.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                                AbsorbPointer(
                                  absorbing: disableAnswer,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      answerButton(0),
                                      answerButton(1),
                                      answerButton(2)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ])),
                Positioned(
                  top: 0,
                  left: _divwidth * 0.5 - _divwidth * 0.15,
                  child: Container(
                    width: _divwidth * 0.3,
                    height: _divwidth * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/ludoHalf.png'),
                            fit: BoxFit.fitHeight)),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Retour(),
                          Menu(grade: widget.grade),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        )));
  }
}

/*class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Final Score: $score",
                style: new TextStyle(fontSize: 35.0),
              ),
              new Padding(padding: EdgeInsets.all(30.0)),
              new MaterialButton(
                color: Colors.red,
                onPressed: () {
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text(
                  "Reset Quiz",
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/
