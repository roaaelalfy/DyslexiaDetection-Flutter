import 'dart:math';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../GenerateRandomExercises.dart';

class Q8Screen extends StatelessWidget {
  Q8Screen({Key? key}): super(key: key,);

  List<List<String>> Q8LettersLists = [
    ['pra','par','gar','qar','are','gra','dar','qar','der','ger','gre','bar']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          currentScreen: 8,
          letters: generateExercise(Q8LettersLists),
          gridSize: 6,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q8Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q9Screen); },
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

