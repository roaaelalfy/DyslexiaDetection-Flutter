import 'dart:math';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../GenerateRandomExercises.dart';

class Q6Screen extends StatelessWidget {
  Q6Screen({Key? key}): super(key: key,);

  List<List<String>> Q6LettersLists = [
    ['ne','no','de','na','pu','qu','be','qe','da','pa','ba','pe','da']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          letters: generateExercise(Q6LettersLists),
          gridSize: 6,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q6Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q7Screen); },
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

