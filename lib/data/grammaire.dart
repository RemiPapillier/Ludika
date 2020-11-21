import 'dart:math';
import 'package:Ludika/screens/exercice.dart';

Quiz getQuizGram(int grade) {
  if (grade == 1) {
    return getQuizGramCp();
  } else if (grade == 2) {
    return getQuizGramCe1();
  } else if (grade == 3) {
    return getQuizGramCe2();
  } else if (grade == 4) {
    return getQuizGramCm1();
  } else {
    return getQuizGramCm2();
  }
}

Quiz getQuizGramCp() {
  var quiz = Quiz();
  var quiz1 = QuizGramDetCP();
  var list1 = [];
  var quiz2 = QuizGramEcritureCP();
  var list2 = [];
  var quiz3 = QuizGramSujetCP();
  var list3 = [];
  var quiz4 = QuizGramVerbeCP();
  var list4 = [];
  var rng = Random();
  for (var x = 0; x < 10; x++) {
    list1.add(x);
    list2.add(x);
    list3.add(x);
    list4.add(x);
  }
  list1.shuffle();
  list2.shuffle();
  list3.shuffle();
  list4.shuffle();
  for (var i = 0; i < 10; i++) {
    var c = rng.nextInt(100);
    if (c < 25) {
      quiz.questions.add(quiz1.questions[list1[i]]);
      quiz.images.add(quiz1.images[list1[i]]);
      quiz.exercices.add(quiz1.exercices[list1[i]]);
      quiz.choices.add(quiz1.choices[list1[i]]);
      quiz.correctAnswers.add(quiz1.correctAnswers[list1[i]]);
    } else if (c >= 25 && c < 50) {
      quiz.questions.add(quiz2.questions[list2[i]]);
      quiz.images.add(quiz2.images[list2[i]]);
      quiz.exercices.add(quiz2.exercices[list2[i]]);
      quiz.choices.add(quiz2.choices[list2[i]]);
      quiz.correctAnswers.add(quiz2.correctAnswers[list2[i]]);
    } else if (c >= 50 && c < 75) {
      quiz.questions.add(quiz3.questions[list3[i]]);
      quiz.images.add(quiz3.images[list3[i]]);
      quiz.exercices.add(quiz3.exercices[list3[i]]);
      quiz.choices.add(quiz3.choices[list3[i]]);
      quiz.correctAnswers.add(quiz3.correctAnswers[list3[i]]);
    } else {
      quiz.questions.add(quiz4.questions[list4[i]]);
      quiz.images.add(quiz4.images[list4[i]]);
      quiz.exercices.add(quiz4.exercices[list4[i]]);
      quiz.choices.add(quiz4.choices[list4[i]]);
      quiz.correctAnswers.add(quiz4.correctAnswers[list4[i]]);
    }
  }
  return quiz;
}

Quiz getQuizGramCe1() {
  return Quiz();
}

Quiz getQuizGramCe2() {
  return Quiz();
}

Quiz getQuizGramCm1() {
  return Quiz();
}

Quiz getQuizGramCm2() {
  return Quiz();
}

class QuizGramDetCP {
  var questions = [
    "Trouve le bon déterminant",
    "Trouve le bon déterminant",
    "Trouve le bon déterminant",
    "Trouve le bon déterminant",
    "Trouve le bon déterminant",
    "Trouve le bon déterminant",
    "Trouve le bon déterminant",
    "Trouve le bon déterminant",
    "Trouve le bon déterminant",
    "Trouve le bon déterminant",
    "Trouve le bon déterminant",
  ];
  var images = [
    "chat",
    "chemise",
    "pluie",
    "poule",
    "yeux",
    "crayon",
    "nez",
    "robe",
    "arbres",
    "cochon"
  ];
  var exercices = [
    "__ chat.",
    "__ chemises.",
    "__ pluie.",
    "__ poule.",
    "__ yeux.",
    "__ crayon.",
    "__ nez.",
    "__ robe.",
    "__ arbres.",
    "__ cochon.",
  ];
  var choices = [
    ["Une", "Un", "Des"],
    ["Des", "Le", "La"],
    ["Le", "Les", "La"],
    ["Un", "Les", "Une"],
    ["Un", "Une", "Les"],
    ["Un", "Une", "La"],
    ["La", "Le", "Une"],
    ["Une", "Un", "Les"],
    ["Le", "Un", "Les"],
    ["Une", "Un", "Les"]
  ];
  var correctAnswers = [
    "Un",
    "Des",
    "La",
    "Une",
    "Les",
    "Un",
    "Le",
    "Une",
    "Les",
    "Un"
  ];
}

class QuizGramEcritureCP {
  var questions = [
    "Trouve la bonne écriture",
    "Trouve la bonne écriture",
    "Trouve la bonne écriture",
    "Trouve la bonne écriture",
    "Trouve la bonne écriture",
    "Trouve la bonne écriture",
    "Trouve la bonne écriture",
    "Trouve la bonne écriture",
    "Trouve la bonne écriture",
    "Trouve la bonne écriture",
    "Trouve la bonne écriture",
  ];
  var images = [
    "chiens",
    "panier",
    "copains",
    "chateau",
    "foret",
    "macarons",
    "lit",
    "pieds",
    "chevaux",
    "pont"
  ];
  var exercices = [
    "Des ____.",
    "Un ____.",
    "Mes ____.",
    "Les ____.",
    "Une ____.",
    "Un ____.",
    "Le ____.",
    "Les ____.",
    "Des ____.",
    "Un ____.",
  ];
  var choices = [
    ["chiens", "chien", "chient"],
    ["paniers", "panié", "panier"],
    ["copain", "copains", "copin"],
    ["château", "châteaux", "châteaus"],
    ["forêts", "faurêt", "forêt"],
    ["macarons", "macaron", "macarond"],
    ["lit", "lis", "lits"],
    ["pied", "pieds", "piers"],
    ["chevaus", "chevaux", "chevals"],
    ["ponts", "pond", "pont"]
  ];
  var correctAnswers = [
    "chiens",
    "panier",
    "copains",
    "châteaux",
    "forêt",
    "macaron",
    "lit",
    "pieds",
    "chevaux",
    "pont"
  ];
}

class QuizGramSujetCP {
  var questions = [
    "Retrouve le sujet dans la phrase",
    "Retrouve le sujet dans la phrase",
    "Retrouve le sujet dans la phrase",
    "Retrouve le sujet dans la phrase",
    "Retrouve le sujet dans la phrase",
    "Retrouve le sujet dans la phrase",
    "Retrouve le sujet dans la phrase",
    "Retrouve le sujet dans la phrase",
    "Retrouve le sujet dans la phrase",
    "Retrouve le sujet dans la phrase",
  ];
  var images = [
    "chatLait",
    "bain",
    "jardinage",
    "panierLegumes",
    "hibou",
    "queue",
    "halteres",
    "discussion",
    "puzzle",
    "pizza"
  ];
  var exercices = [
    "Le chat boit du lait.",
    "Il prend son bain.",
    "Elles font du jardinage.",
    "Il y a des légumes dans le panier.",
    "Le hibou vit la nuit.",
    "Julie fait la queue derrière Mathieu.",
    "En levant des haltères, Chloé fait du sport.",
    "Les filles discutent entre elles.",
    "Ils font un puzzle.",
    "Maxime mange une pizza.",
  ];
  var choices = [
    ["boit", "Le chat", "lait"],
    ["Il", "bain", "prend"],
    ["jardinage", "font", "Elles"],
    ["Il", "légumes", "le panier"],
    ["Le hibou", "la nuit", "vit"],
    ["queue", "Julie", "Mathieu"],
    ["haltères", "sport", "Chloé"],
    ["Les filles", "discutent", "elles"],
    ["puzzle", "Ils", "font"],
    ["Maxime", "pizza", "mange"]
  ];
  var correctAnswers = [
    "Le chat",
    "Il",
    "Elles",
    "Il",
    "Le hibou",
    "Julie",
    "Chloé",
    "Les filles",
    "Ils",
    "Maxime"
  ];
}

class QuizGramVerbeCP {
  var questions = [
    "Retrouve le verbe dans la phrase",
    "Retrouve le verbe dans la phrase",
    "Retrouve le verbe dans la phrase",
    "Retrouve le verbe dans la phrase",
    "Retrouve le verbe dans la phrase",
    "Retrouve le verbe dans la phrase",
    "Retrouve le verbe dans la phrase",
    "Retrouve le verbe dans la phrase",
    "Retrouve le verbe dans la phrase",
    "Retrouve le verbe dans la phrase",
  ];
  var images = [
    "beignet",
    "cerceau",
    "pomme",
    "veloFamille",
    "plantes",
    "chanson",
    "anniversaire",
    "jeuxSociete",
    "coiffeur",
    "courses"
  ];
  var exercices = [
    "Le beignet est au chocolat.",
    "Camille joue au cerceau.",
    "Tu manges une pomme.",
    "Toute la famille fait du vélo.",
    "Emilie arrose les plantes.",
    "Gabriel chante une chanson.",
    "Ils font la fête pour son anniversaire.",
    "Vous jouez aux jeux de société.",
    "Je suis chez le coiffeur.",
    "Nous faisons les courses.",
  ];
  var choices = [
    ["beignet", "chocolat", "est"],
    ["Camille", "joue", "cerceau"],
    ["manges", "pomme", "Tu"],
    ["vélo", "famille", "fait"],
    ["Emilie", "arrose", "les plantes"],
    ["chanson", "chante", "Gabriel"],
    ["font", "la fête", "Ils"],
    ["jeux", "jouez", "Vous"],
    ["suis", "Je", "coiffeur"],
    ["Nous", "courses", "faisons"]
  ];
  var correctAnswers = [
    "est",
    "joue",
    "manges",
    "fait",
    "arrose",
    "chante",
    "font",
    "jouez",
    "suis",
    "faisons"
  ];
}
