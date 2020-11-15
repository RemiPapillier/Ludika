import 'dart:math';
import 'package:Ludika/screens/exercice.dart';

Quiz getQuizConj(int grade) {
  if (grade == 1) {
    return getQuizConjCp();
  } else if (grade == 2) {
    return getQuizConjCe1();
  } else if (grade == 3) {
    return getQuizConjCe2();
  } else if (grade == 4) {
    return getQuizConjCm1();
  } else {
    return getQuizConjCm2();
  }
}

Quiz getQuizConjCp() {
  var quiz = Quiz();
  var quiz1 = QuizConjVerbeCP();
  var list1 = [];
  var quiz2 = QuizConjSujetCP();
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

Quiz getQuizConjCe1() {
  return Quiz();
}

Quiz getQuizConjCe2() {
  return Quiz();
}

Quiz getQuizConjCm1() {
  return Quiz();
}

Quiz getQuizConjCm2() {
  return Quiz();
}

class QuizConjVerbeCP {
  var questions = [
    "Trouve la conjugaison du verbe",
    "Trouve la conjugaison du verbe",
    "Trouve la conjugaison du verbe",
    "Trouve la conjugaison du verbe",
    "Trouve la conjugaison du verbe",
    "Trouve la conjugaison du verbe",
    "Trouve la conjugaison du verbe",
    "Trouve la conjugaison du verbe",
    "Trouve la conjugaison du verbe",
    "Trouve la conjugaison du verbe"
  ];
  var images = [
    "danse",
    "habit",
    "brosseDent",
    "lisLivre",
    "repasFamille",
    "photo",
    "regarderTele",
    "mamanCuisine",
    "jouerPoupee",
    "lisHistoire"
  ];
  var exercices = [
    "Juliette ____ avec sa copine.",
    "Emma ____ sa chemise.",
    "Thomas se ____ les dents.",
    "Je ____ un livre.",
    "Nous ____ ensemble.",
    "Tu me ____ en photo.",
    "Vous ____ la télévision.",
    "Maman ____ à manger.",
    "Julien et Léa ____ à la poupée.",
    "Papa et maman ____ une histoire."
  ];
  var choices = [
    ["danse", "dansons", "dansent"],
    ["attache", "attachez", "attaches"],
    ["brosser", "brosse", "brossent"],
    ["lis", "lit", "lisez"],
    ["mange", "mangeons", "mangez"],
    ["prennent", "prendre", "prends"],
    ["regardes", "regardons", "regardez"],
    ["prépare", "préparons", "prépares"],
    ["joue", "jouent", "joues"],
    ["lisent", "lisons", "lis"]
  ];
  var correctAnswers = [
    "danse",
    "attache",
    "brosse",
    "lis",
    "mangeons",
    "prends",
    "regardez",
    "prépare",
    "jouent",
    "lisent"
  ];
}

class QuizConjSujetCP {
  var questions = [
    "Trouve le pronom correspondant",
    "Trouve le pronom correspondant",
    "Trouve le pronom correspondant",
    "Trouve le pronom correspondant",
    "Trouve le pronom correspondant",
    "Trouve le pronom correspondant",
    "Trouve le pronom correspondant",
    "Trouve le pronom correspondant",
    "Trouve le pronom correspondant",
    "Trouve le pronom correspondant",
    "Trouve le pronom correspondant",
  ];
  var images = [
    "ecrire",
    "manger",
    "crier",
    "regarder",
    "sourire",
    "gouter",
    "cuisiner",
    "ecouter",
    "parler",
    "voyager"
  ];
  var exercices = [
    "__ écrivez.",
    "__ manges.",
    "__ crie.",
    "__ regardons.",
    "__ sourient.",
    "__ goûte.",
    "__ cuisine.",
    "__ écoute.",
    "__ parle.",
    "__ voyagent."
  ];
  var choices = [
    ["Vous", "Nous", "Je"],
    ["Tu", "Il", "Vous"],
    ["Nous", "Elle", "Ils"],
    ["Elles", "Vous", "Nous"],
    ["Elles", "Elle", "Je"],
    ["Nous", "Je", "Tu"],
    ["Vous", "Tu", "On"],
    ["Il", "Nous", "Ils"],
    ["Je", "Vous", "Ils"],
    ["On", "Ils", "Tu"]
  ];
  var correctAnswers = [
    "Vous",
    "Tu",
    "Elle",
    "Nous",
    "Elles",
    "Je",
    "On",
    "Il",
    "Je",
    "Ils"
  ];
}
