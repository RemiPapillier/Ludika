import 'dart:math';
import 'package:Ludika/screens/exercice.dart';

Quiz getQuizSyl(int grade) {
  if (grade == 1) {
    return getQuizSylCp();
  } else if (grade == 2) {
    return getQuizSylCe1();
  } else if (grade == 3) {
    return getQuizSylCe2();
  } else if (grade == 4) {
    return getQuizSylCm1();
  } else {
    return getQuizSylCm2();
  }
}

Quiz getQuizSylCp() {
  var quiz = Quiz();
  var quiz1 = QuizSylRemplirCP();
  var list1 = [];
  var quiz2 = QuizSylNombreCP();
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

Quiz getQuizSylCe1() {
  return Quiz();
}

Quiz getQuizSylCe2() {
  return Quiz();
}

Quiz getQuizSylCm1() {
  return Quiz();
}

Quiz getQuizSylCm2() {
  return Quiz();
}

class QuizSylRemplirCP {
  var questions = [
    "Complète le mot avec la bonne syllabe",
    "Complète le mot avec la bonne syllabe",
    "Complète le mot avec la bonne syllabe",
    "Complète le mot avec la bonne syllabe",
    "Complète le mot avec la bonne syllabe",
    "Complète le mot avec la bonne syllabe",
    "Complète le mot avec la bonne syllabe",
    "Complète le mot avec la bonne syllabe",
    "Complète le mot avec la bonne syllabe",
    "Complète le mot avec la bonne syllabe",
  ];
  var images = [
    "lapin",
    "ecureuil",
    "parapluie",
    "lunettes",
    "velo",
    "chaussures",
    "vache",
    "canard",
    "ballon",
    "guitare"
  ];
  var exercices = [
    "__pin",
    "E__reuil",
    "Pa__pluie",
    "__nette",
    "Vé__",
    "Ch__ssures",
    "__che",
    "__nard",
    "__llon",
    "Gui__re",
  ];
  var choices = [
    ["Ma", "Ca", "La"],
    ["co", "cu", "ci"],
    ["ra", "re", "ru"],
    ["Lu", "La", "Le"],
    ["mo", "ro", "lo"],
    ["ou", "au", "eu"],
    ["Va", "Ve", "Vi"],
    ["La", "Ca", "Ma"],
    ["Ba", "Be", "Bi"],
    ["ma", "la", "ta"]
  ];
  var correctAnswers = [
    "La",
    "cu",
    "ra",
    "Lu",
    "lo",
    "au",
    "Va",
    "Ca",
    "Ba",
    "ta"
  ];
}

class QuizSylNombreCP {
  var questions = [
    "Trouve le nombre de syllabe de ce mot",
    "Trouve le nombre de syllabe de ce mot",
    "Trouve le nombre de syllabe de ce mot",
    "Trouve le nombre de syllabe de ce mot",
    "Trouve le nombre de syllabe de ce mot",
    "Trouve le nombre de syllabe de ce mot",
    "Trouve le nombre de syllabe de ce mot",
    "Trouve le nombre de syllabe de ce mot",
    "Trouve le nombre de syllabe de ce mot",
    "Trouve le nombre de syllabe de ce mot",
  ];
  var images = [
    "gaufre",
    "avion",
    "chocolat",
    "loup",
    "valise",
    "peluche",
    "elephant",
    "ours",
    "canape",
    "maison"
  ];
  var exercices = [
    "Gauffre",
    "Avion",
    "Chocolat",
    "Loup",
    "Valise",
    "Peluche",
    "Eléphant",
    "Ours",
    "Canapé",
    "Maison",
  ];
  var choices = [
    ["1", "2", "3"],
    ["1", "2", "3"],
    ["3", "4", "5"],
    ["1", "2", "3"],
    ["2", "3", "4"],
    ["3", "4", "5"],
    ["2", "3", "4"],
    ["1", "2", "3"],
    ["3", "4", "5"],
    ["2", "3", "4"]
  ];
  var correctAnswers = ["2", "2", "3", "1", "3", "3", "3", "1", "3", "2"];
}
