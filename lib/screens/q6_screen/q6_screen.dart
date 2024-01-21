import 'dart:math';
import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/6x6Matrix.dart';
import 'package:flutter/material.dart';

import '../Q1-4/GenerateRandomLetters.dart';

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

