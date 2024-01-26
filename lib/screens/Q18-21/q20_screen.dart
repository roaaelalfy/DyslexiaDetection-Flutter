import 'dart:math';
import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';

import '../GenerateRandomExercises.dart';

class Q20Screen extends StatelessWidget {
  Q20Screen({Key? key}): super(key: key,);

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
          randomizeList: true,
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