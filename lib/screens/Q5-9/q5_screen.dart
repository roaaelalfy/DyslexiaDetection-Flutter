import 'dart:math';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../GenerateRandomExercises.dart';

class Q5Screen extends StatelessWidget {
  Q5Screen({Key? key}): super(key: key,);

  List<List<String>> Q5LettersLists = [
    ['ne','no','de','na','pu','qu','be','qe','da','pa','ba','pe','da']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          currentScreen:5,
          letters: generateExercise(Q5LettersLists),
          gridSize: 5,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q5Screen);},
            navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q6Screen); },
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

