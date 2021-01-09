import 'package:Ludika/screens/exercice.dart';

//Get appropriate Quizz for a specific grade
Quiz getQuizHeure(int grade) {
  if (grade == 1) {
    return getQuizHeureCp();
  } else if (grade == 2) {
    return getQuizHeureCe1();
  } else if (grade == 3) {
    return getQuizHeureCe2();
  } else if (grade == 4) {
    return getQuizHeureCm1();
  } else {
    return getQuizHeureCm2();
  }
}

//Return an hour quiz for cp with random and shuffled hour exercices
Quiz getQuizHeureCp() {
  var quiz = Quiz();
  var quiz1 = QuizHeureHorlogeCP();
  var list1 = [];
  for (var x = 0; x < 10; x++) {
    list1.add(x);
  }
  list1.shuffle();
  for (var i = 0; i < 10; i++) {
    quiz.questions.add(quiz1.questions[list1[i]]);
    quiz.images.add(quiz1.images[list1[i]]);
    quiz.exercices.add(quiz1.exercices[list1[i]]);
    quiz.choices.add(quiz1.choices[list1[i]]);
    quiz.correctAnswers.add(quiz1.correctAnswers[list1[i]]);
  }
  return quiz;
}

Quiz getQuizHeureCe1() {
  return Quiz();
}

Quiz getQuizHeureCe2() {
  return Quiz();
}

Quiz getQuizHeureCm1() {
  return Quiz();
}

Quiz getQuizHeureCm2() {
  return Quiz();
}

class QuizHeureHorlogeCP {
  var questions = [
    "Quelle heure est-il ?",
    "Quelle heure est-il ?",
    "Quelle heure est-il ?",
    "Quelle heure est-il ?",
    "Quelle heure est-il ?",
    "Quelle heure est-il ?",
    "Quelle heure est-il ?",
    "Quelle heure est-il ?",
    "Quelle heure est-il ?",
    "Quelle heure est-il ?",
  ];
  var images = [
    "1h30",
    "3h",
    "4h30",
    "5h",
    "6h",
    "8h",
    "9h30",
    "10h30",
    "11h30",
    "12h"
  ];
  var exercices = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  var choices = [
    ["06h10", "01h30", "06h00"],
    ["03h00", "12h00", "12h15"],
    ["04h00", "06h20", "04h30"],
    ["05h12", "05h00", "12h25"],
    ["06h00", "12h30", "06h30"],
    ["12h40", "08h00", "12h08"],
    ["09h00", "06h09", "09h30"],
    ["06h10", "10h30", "10h00"],
    ["11h30", "06h11", "11H00"],
    ["12h12", "12h00", "12h30"]
  ];
  var correctAnswers = [
    "01h30",
    "03h00",
    "04h30",
    "05h00",
    "06h00",
    "08h00",
    "09h30",
    "10h30",
    "11h30",
    "12h00"
  ];
}
