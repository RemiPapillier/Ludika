import 'package:Ludika/screens/quiz1.dart';
import 'package:Ludika/services/conjugaison.dart';
import 'package:Ludika/widgets/menu.dart';
import 'package:Ludika/widgets/retour.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = new AnimalQuiz();

class AnimalQuiz {
  var images = ["danse", "habit", "photo", "lisLivre"];

  var questions = [
    "This animal is a carnivorous reptile.",
    "_________ like to chase mice and birds.",
    "Give a _________ a bone and he will find his way home",
    "A nocturnal animal with some really big eyes",
  ];

  var choices = [
    ["Cat", "Sheep", "Alligator", "Cow"],
    ["Cat", "Snail", "Slug", "Horse"],
    ["Mouse", "Dog", "Elephant", "Donkey"],
    ["Spider", "Snake", "Hawk", "Owl"]
  ];

  var correctAnswers = ["Alligator", "Cat", "Dog", "Owl"];
}

class Quiz1 extends StatefulWidget {
  Quiz1({this.grade, this.matiere});
  final int grade;
  final String matiere;
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
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
          body: new Container(
            height: _divheight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: displayBackground(),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.color),
                fit: BoxFit.cover,
              ),
            ),
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),
                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "${questionNumber + 1} / ${quiz.questions.length}",
                        style: new TextStyle(fontSize: 22.0),
                      ),
                      new Text(
                        "Score: $finalScore",
                        style: new TextStyle(fontSize: 22.0),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/exo/${quiz.images[questionNumber]}.jpg"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 1
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][0] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][0],
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),

                    //button 2
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][1] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][1],
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 3
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][2] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][2],
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),

                    //button 4
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][3] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][3],
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                new Padding(padding: EdgeInsets.all(15.0)),
                new Container(
                    alignment: Alignment.bottomCenter,
                    child: new MaterialButton(
                        minWidth: 240.0,
                        height: 30.0,
                        color: Colors.red,
                        onPressed: resetQuiz,
                        child: new Text(
                          "Quit",
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.white),
                        ))),
              ],
            ),
          ),
        ));
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(
                      score: finalScore,
                    )));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
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
}
