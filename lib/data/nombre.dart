import 'dart:math';
import 'package:Ludika/screens/exercice.dart';

Quiz getQuizNomb(int grade) {
  if (grade == 1) {
    return getQuizNombCp();
  } else if (grade == 2) {
    return getQuizNombCe1();
  } else if (grade == 3) {
    return getQuizNombCe2();
  } else if (grade == 4) {
    return getQuizNombCm1();
  } else {
    return getQuizNombCm2();
  }
}

Quiz getQuizNombCp() {
  var quiz = Quiz();
  var quiz1 = QuizNombSuiteCP();
  var list1 = [];
  var quiz2 = QuizNombEgaliteCP();
  var list2 = [];
  var rng = Random();
  for (var x = 0; x < 10; x++) {
    list1.add(x);
    list2.add(x);
  }
  list1.shuffle();
  list2.shuffle();
  for (var i = 0; i < 10; i++) {
    var c = rng.nextInt(100);
    if (c < 50) {
      quiz.questions.add(quiz1.questions[list1[i]]);
      quiz.images.add(quiz1.images[list1[i]]);
      quiz.exercices.add(quiz1.exercices[list1[i]]);
      quiz.choices.add(quiz1.choices[list1[i]]);
      quiz.correctAnswers.add(quiz1.correctAnswers[list1[i]]);
    } else {
      quiz.questions.add(quiz2.questions[list2[i]]);
      quiz.images.add(quiz2.images[list2[i]]);
      quiz.exercices.add(quiz2.exercices[list2[i]]);
      quiz.choices.add(quiz2.choices[list2[i]]);
      quiz.correctAnswers.add(quiz2.correctAnswers[list2[i]]);
    }
  }
  return quiz;
}

Quiz getQuizNombCe1() {
  return Quiz();
}

Quiz getQuizNombCe2() {
  return Quiz();
}

Quiz getQuizNombCm1() {
  return Quiz();
}

Quiz getQuizNombCm2() {
  return Quiz();
}

class QuizNombSuiteCP {
  var questions = [
    "Complète la suite",
    "Complète la suite",
    "Complète la suite",
    "Complète la suite",
    "Complète la suite",
    "Complète la suite",
    "Complète la suite",
    "Complète la suite",
    "Complète la suite",
    "Complète la suite"
  ];
  var images = [
    "suite1",
    "suite2",
    "suite3",
    "suite4",
    "suite5",
    "suite6",
    "suite7",
    "suite8",
    "suite9",
    "suite10"
  ];
  var exercices = ["", "", "", "", "", "", "", "", "", ""];
  var choices = [
    ["5", "6", "7"],
    ["12", "15", "25"],
    ["0", "3", "5"],
    ["5", "7", "10"],
    ["4", "5", "6"],
    ["25", "35", "30"],
    ["20", "21", "21"],
    ["9", "8", "15"],
    ["30", "45", "50"],
    ["10", "20", "15"]
  ];
  var correctAnswers = ["6", "15", "3", "7", "5", "30", "21", "9", "50", "15"];
}

class QuizNombEgaliteCP {
  var questions = [
    "Complète l'égalité ou inégalité",
    "Complète l'égalité ou inégalité",
    "Complète l'égalité ou inégalité",
    "Complète l'égalité ou inégalité",
    "Complète l'égalité ou inégalité",
    "Complète l'égalité ou inégalité",
    "Complète l'égalité ou inégalité",
    "Complète l'égalité ou inégalité",
    "Complète l'égalité ou inégalité",
    "Complète l'égalité ou inégalité"
  ];
  var images = [
    "egalite1",
    "egalite2",
    "egalite3",
    "egalite4",
    "egalite5",
    "egalite6",
    "egalite7",
    "egalite8",
    "egalite9",
    "egalite10"
  ];
  var exercices = ["", "", "", "", "", "", "", "", "", ""];
  var choices = [
    ["<", "=", ">"],
    ["<", "=", ">"],
    ["<", "=", ">"],
    ["<", "=", ">"],
    ["<", "=", ">"],
    ["<", "=", ">"],
    ["<", "=", ">"],
    ["<", "=", ">"],
    ["<", "=", ">"],
    ["<", "=", ">"]
  ];
  var correctAnswers = [">", ">", ">", ">", "=", "=", "<", "<", "<", "<"];
}
