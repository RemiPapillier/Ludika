import 'dart:math';
import 'package:Ludika/screens/exercice.dart';

//Get appropriate Quizz for a specific grade
Quiz getQuizCalcul(int grade) {
  if (grade == 1) {
    return getQuizCalculCp();
  } else if (grade == 2) {
    return getQuizCalculCe1();
  } else if (grade == 3) {
    return getQuizCalculCe2();
  } else if (grade == 4) {
    return getQuizCalculCm1();
  } else {
    return getQuizCalculCm2();
  }
}

//Return a calcul quiz for cp with random and shuffled calcul exercices
Quiz getQuizCalculCp() {
  var quiz = Quiz();
  var quiz1 = QuizCalculAddiCP();
  var list1 = [];
  var quiz2 = QuizCalculSousCP();
  var list2 = [];
  var quiz3 = QuizCalculComptCP();
  var list3 = [];
  var rng = Random();
  for (var x = 0; x < 10; x++) {
    list1.add(x);
    list2.add(x);
    list3.add(x);
  }
  list1.shuffle();
  list2.shuffle();
  list3.shuffle();
  for (var i = 0; i < 10; i++) {
    var c = rng.nextInt(100);
    if (c < 33) {
      quiz.questions.add(quiz1.questions[list1[i]]);
      quiz.images.add(quiz1.images[list1[i]]);
      quiz.exercices.add(quiz1.exercices[list1[i]]);
      quiz.choices.add(quiz1.choices[list1[i]]);
      quiz.correctAnswers.add(quiz1.correctAnswers[list1[i]]);
    } else if (c >= 33 && c < 67) {
      quiz.questions.add(quiz2.questions[list2[i]]);
      quiz.images.add(quiz2.images[list2[i]]);
      quiz.exercices.add(quiz2.exercices[list2[i]]);
      quiz.choices.add(quiz2.choices[list2[i]]);
      quiz.correctAnswers.add(quiz2.correctAnswers[list2[i]]);
    } else {
      quiz.questions.add(quiz3.questions[list3[i]]);
      quiz.images.add(quiz3.images[list3[i]]);
      quiz.exercices.add(quiz3.exercices[list3[i]]);
      quiz.choices.add(quiz3.choices[list3[i]]);
      quiz.correctAnswers.add(quiz3.correctAnswers[list3[i]]);
    }
  }
  return quiz;
}

Quiz getQuizCalculCe1() {
  return Quiz();
}

Quiz getQuizCalculCe2() {
  return Quiz();
}

Quiz getQuizCalculCm1() {
  return Quiz();
}

Quiz getQuizCalculCm2() {
  return Quiz();
}

class QuizCalculAddiCP {
  var questions = [
    "Trouve le résultat de l'addition",
    "Trouve le résultat de l'addition",
    "Trouve le résultat de l'addition",
    "Trouve le résultat de l'addition",
    "Trouve le résultat de l'addition",
    "Trouve le résultat de l'addition",
    "Trouve le résultat de l'addition",
    "Trouve le résultat de l'addition",
    "Trouve le résultat de l'addition",
    "Trouve le résultat de l'addition",
  ];
  var images = [
    "ad1",
    "ad2",
    "ad3",
    "ad4",
    "ad5",
    "ad6",
    "ad7",
    "ad8",
    "ad9",
    "ad10"
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
    ["100", "11", "20"],
    ["4", "10", "13"],
    ["7", "3", "6"],
    ["8", "10", "9"],
    ["9", "7", "6"],
    ["6", "10", "7"],
    ["3", "4", "5"],
    ["10", "0", "8"],
    ["8", "12", "9"],
    ["10", "12", "14"]
  ];
  var correctAnswers = [
    "20",
    "10",
    "7",
    "10",
    "6",
    "10",
    "3",
    "10",
    "12",
    "14"
  ];
}

class QuizCalculSousCP {
  var questions = [
    "Trouve le résultat de la soustration",
    "Trouve le résultat de la soustration",
    "Trouve le résultat de la soustration",
    "Trouve le résultat de la soustration",
    "Trouve le résultat de la soustration",
    "Trouve le résultat de la soustration",
    "Trouve le résultat de la soustration",
    "Trouve le résultat de la soustration",
    "Trouve le résultat de la soustration",
    "Trouve le résultat de la soustration",
  ];
  var images = [
    "sous1",
    "sous2",
    "sous3",
    "sous4",
    "sous5",
    "sous6",
    "sous7",
    "sous8",
    "sous9",
    "sous10"
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
    ["2", "8", "6"],
    ["1", "2", "3"],
    ["5", "9", "3"],
    ["7", "8", "6"],
    ["5", "6", "4"],
    ["7", "8", "9"],
    ["0", "1", "10"],
    ["3", "4", "5"],
    ["2", "3", "4"],
    ["10", "11", "9"]
  ];
  var correctAnswers = ["2", "2", "3", "7", "6", "9", "0", "4", "4", "10"];
}

class QuizCalculComptCP {
  var questions = [
    "Combieb y a-t-il de cartes ?",
    "Combieb y a-t-il de ballons ?",
    "Combieb y a-t-il de bougies ?",
    "Combieb y a-t-il de boules ?",
    "Combieb y a-t-il de livres ?",
    "Combieb y a-t-il de peluches ?",
    "Combieb y a-t-il de chaussures ?",
    "Combieb y a-t-il de pommes ?",
    "Combieb y a-t-il de poussins ?",
    "Combieb y a-t-il de quilles ?",
  ];
  var images = [
    "cartes",
    "ballons",
    "bougies",
    "boules",
    "livres",
    "peluches",
    "personnes",
    "pommes",
    "poussins",
    "quilles"
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
    ["5", "4", "6"],
    ["6", "7", "8"],
    ["9", "10", "11"],
    ["13", "14", "15"],
    ["4", "5", "6"],
    ["3", "4", "2"],
    ["12", "13", "14"],
    ["5", "6", "7"],
    ["1", "2", "3"],
    ["3", "4", "5"]
  ];
  var correctAnswers = ["5", "7", "11", "13", "5", "2", "12", "6", "3", "3"];
}
