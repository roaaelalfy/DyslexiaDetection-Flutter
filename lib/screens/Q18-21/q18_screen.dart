import 'dart:math';
import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/3x3Matrix.dart';
import 'package:flutter/material.dart';

import '../GenerateRandomExercises.dart';

class Q18Screen extends StatelessWidget {
  Q18Screen({Key? key}): super(key: key,);

  List<List<String>> Q1819NonWordsLists = [
    ['matapa','madata','mapaba','damata','pamama','mamata'],
    ['bapama','dapama','madapa','tapama']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          letters: generateExercise(Q1819NonWordsLists),
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