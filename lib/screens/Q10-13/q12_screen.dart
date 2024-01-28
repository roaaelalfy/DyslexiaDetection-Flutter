import 'dart:math';

import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../GenerateRandomExercises.dart';

class Q12Screen extends StatelessWidget {
  Q12Screen({Key? key}): super(key: key,);
  List<List<String>> Q12List = [
    ["shade" , "sheet" , "seed" ,"clean" , "neat",
      "read" , "red" , "cheat" , "chase",  "meat",
      "neat" , "chase" , "chase" , "dress" , "shade",
      "red" , "check" , "read" , "chase" , "net",
      "neat" , "shade" , "red" , "cheat" , "shade"
    ],
    ["coat" , "cough" , "dough" ,"boat" , "gloat",
      "shoot" , "note" , "caught" , "chose",  "loose",
      "mose" , "rough" , "rogue" , "note" , "suit",
      "boot" , "road" , "taught" , "chose" , "nose",
      "note" , "cough" , "mose" , "rough" , "tough"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          currentScreen: 12,
          letters: generateExercise(Q12List),
          gridSize: 5,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q12Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q13Screen); },
        )
    );
  }

  List<String> generateExercise(List<List<String>> letters) {
    List<String> exerciseLetters = [];
    Random random = Random();

    for (int i = 0; i < letters.length; i++) {
      int randomIndex= random.nextInt(letters.length);
      exerciseLetters = letters[randomIndex];
    }
    exerciseLetters.shuffle();
    return exerciseLetters;
  }
}