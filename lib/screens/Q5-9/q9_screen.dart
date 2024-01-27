import 'dart:math';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../GenerateRandomExercises.dart';

class Q9Screen extends StatelessWidget {
  Q9Screen({Key? key}): super(key: key,);

  List<List<String>> Q9LettersLists = [
    ['grel','glis','glil','gris','gerl']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          currentScreen: 9,
          letters: generateExercise(Q9LettersLists),
          gridSize: 3,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q9Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q10Screen); },
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

