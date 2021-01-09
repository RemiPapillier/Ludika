import 'dart:async';

import 'package:Ludika/screens/resultat.dart';
import 'package:Ludika/widgets/menu.dart';
import 'package:Ludika/widgets/retour.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Create a class Quiz that will be initialised by data files
class Quiz {
  var questions = [];
  var images = [];
  var exercices = [];
  var choices = [];
  var correctAnswers = [];
}

//stateful class with grade, matiere and quiz attribute with constructor
class Exercice extends StatefulWidget {
  Exercice({this.grade, this.matiere, this.quiz});
  final int grade;
  final String matiere;
  final Quiz quiz;
  @override
  _ExerciceState createState() => _ExerciceState();
}

class _ExerciceState extends State<Exercice> {
  //define variables
  var finalScore = 0;
  var questionNumber = 0;
  bool show = false;
  String suivant = "Question suivante";

  //Define colors
  Color colorToShow = Colors.indigoAccent;
  Color correct = Colors.green[600];
  Color wrong = Colors.red[600];
  bool disableAnswer = false;

  //create a map for button colors default
  Map<String, Color> btncolor = {
    "0": Color(0xFF282897),
    "1": Color(0xFF282897),
    "2": Color(0xFF282897),
  };

  //function to modify the visibily state of a widget
  void modify() {
    setState(() {
      show = !show;
    });
  }

  //modify text attribute
  void suivantToResultat() {
    setState(() {
      suivant = "Résultats";
    });
  }

  //Chose the appropriate image background
  AssetImage displayBackground() {
    if (widget.matiere == "conjugaison") {
      return AssetImage('assets/images/backPalmier.jpg');
    } else if (widget.matiere == "grammaire") {
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

  //Function to check if the answer is true or false and modify the button color in function of the answer
  void checkAnswer(int nb) {
    if (widget.quiz.choices[questionNumber][nb] ==
        widget.quiz.correctAnswers[questionNumber]) {
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
      Timer(Duration(milliseconds: 500), () {
        modify();
      });
    });
  }

  //function to show the correct answer and modify color to green
  void displayCorrectAnswer() {
    var k;
    for (var i = 0; i < 3; i++) {
      if (widget.quiz.choices[questionNumber][i] ==
          widget.quiz.correctAnswers[questionNumber]) {
        k = i;
      }
    }
    setState(() {
      btncolor[k.toString()] = correct;
    });
  }

  //custom widget for the 3 propositions buttons
  Widget answerButton(int nb) {
    return MaterialButton(
      padding: EdgeInsets.all(3),
      color: btncolor[nb.toString()],
      //launch the correct answer function when clicked
      onPressed: () {
        checkAnswer(nb);
      },
      child: new Text(
        widget.quiz.choices[questionNumber][nb],
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w800,
            fontSize: 17,
            textStyle: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }

  //function to modify question or launch the resultat page if it is the last question
  void updateQuestion() {
    setState(() {
      if (questionNumber == widget.quiz.questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Resultat(
                      score: finalScore,
                      grade: widget.grade,
                      matiere: widget.matiere,
                    )));
        debugPrint(finalScore.toString());
      } else if (questionNumber == widget.quiz.questions.length - 2) {
        suivantToResultat();
        questionNumber++;
      } else {
        questionNumber++;
      }
      //redefine the default parameters
      btncolor["0"] = Color(0xFF282897);
      btncolor["1"] = Color(0xFF282897);
      btncolor["2"] = Color(0xFF282897);
      modify();
      disableAnswer = false;
    });
  }

  //Return the correct matiere in function of matiere widget
  Text displayMatiere() {
    if (widget.matiere == "conjugaison") {
      return Text(
        'Conjugaison',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 26,
            textStyle: TextStyle(
              color: Colors.black,
            )),
      );
    } else if (widget.matiere == "grammaire") {
      return Text(
        'Grammaire',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 26,
            textStyle: TextStyle(color: Colors.black)),
      );
    } else if (widget.matiere == "syllabe") {
      return Text(
        'Syllabes',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 26,
            textStyle: TextStyle(color: Colors.black)),
      );
    } else if (widget.matiere == "nombre") {
      return Text(
        'Nombres',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 26,
            textStyle: TextStyle(color: Colors.black)),
      );
    } else if (widget.matiere == "calcul") {
      return Text(
        'Calcul',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 26,
            textStyle: TextStyle(color: Colors.black)),
      );
    } else {
      return Text(
        'Heure',
        style: GoogleFonts.bellota(
            fontWeight: FontWeight.w900,
            fontSize: 26,
            textStyle: TextStyle(color: Colors.black)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //set max height and width of screen
    var _divheight = MediaQuery.of(context).size.height;
    var _divwidth = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            //Container with appropriate image background
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
            //Main stack
            child: Stack(
              children: [
                Positioned(
                    top: _divwidth * 0.25 - 7,
                    left: _divwidth * 0.05,
                    child: Column(children: [
                      Center(
                        child: Container(
                          width: _divwidth * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            //Column containing all exercice informations
                            child: Column(
                              children: [
                                SizedBox(height: 5),
                                displayMatiere(),
                                SizedBox(height: 5),
                                //Display the exercice statement
                                Text(
                                  widget.quiz.questions[questionNumber],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.bellota(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      textStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                //Display image and question from the quiz object
                                Container(
                                  constraints: BoxConstraints(
                                      minHeight: _divheight * 0.3),
                                  child: Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            height: _divheight * 0.3,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/exo/${widget.quiz.images[questionNumber]}.jpg"),
                                                    fit: BoxFit.fitHeight)),
                                          )),
                                      Text(
                                        widget.quiz.exercices[questionNumber],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.bellota(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            textStyle:
                                                TextStyle(color: Colors.black)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                //Position the 3 answers buttons
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
                                ),
                                SizedBox(height: 10),
                                //Create space for next question which is not visible before button is clicked
                                Visibility(
                                    visible: show,
                                    child: InkWell(
                                      onTap: () {
                                        updateQuestion();
                                      },
                                      //color: Color(0xFF282897).withOpacity(0.2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            suivant,
                                            style: GoogleFonts.bellota(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                textStyle: TextStyle(
                                                  color: Colors.black,
                                                )),
                                          ),
                                          Icon(
                                            Icons.arrow_right,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ])),
                //Positioned ludo at the top of the exercice sheet
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
                //Place the widgets Retour and Menu at the bottom of the page
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
