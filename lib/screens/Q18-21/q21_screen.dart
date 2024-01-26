import 'dart:math';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../GenerateRandomExercises.dart';

class Q21Screen extends StatelessWidget {
  Q21Screen({Key? key}): super(key: key,);

  List<List<String>> Q2021NonWordsLists = [
    ['dabaqa','badaqa','dadapa','pabapa',
      'dadapa','dabapa','babada','dabada','pabapa','babapa']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          letters: generateExercise(Q2021NonWordsLists),
          gridSize: 3,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q21Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q22Screen); },
        )
    );
  }


  List<String> generateExercise(List<List<String>> nonWords) {
    List<String> exerciseNonWords = [];
    Random random = Random();

    for (int i = 0; i < nonWords.length; i++) {
      int randomIndex= random.nextInt(nonWords.length);
      exerciseNonWords = nonWords[randomIndex];
    }
    exerciseNonWords.shuffle();
    return exerciseNonWords;
  }

}