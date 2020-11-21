import 'dart:math';

class QuizConjugaisonCP {
  var questions = [];
  var images = [];
  var exercices = [];
  var choices = [];
  var correctAnswers = [];
}

QuizConjugaisonCP getQuizConjCp() {
  var quiz = QuizConjugaisonCP();
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
    "gouter",
    "cuisiner",
    "ecouter",
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
    ["Nous", "Il", "Ils"],
    ["Elles", "Vous", "Nous"],
    ["Elles", "Elle", "Je"],
    ["Nous", "Je", "Tu"],
    ["Vous", "Tu", "On"],
    ["Elle", "Nous", "Elles"],
    ["Je", "Vous", "Ils"],
    ["On", "Ils", "Tu"]
  ];
  var correctAnswers = [
    "Vous",
    "Tu",
    "Il",
    "Nous",
    "Elles",
    "Je",
    "On",
    "Elle",
    "Je",
    "Ils"
  ];
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

class QuizSyllCompleteCP {
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

class QuizSyllNombreCP {
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
