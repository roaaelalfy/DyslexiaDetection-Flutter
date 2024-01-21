import 'dart:math';
import 'package:flutter/material.dart';

import '../GenerateRandomExercises.dart';

class Q7Screen extends StatelessWidget {
  Q7Screen({Key? key}): super(key: key,);

  List<List<String>> Q7LettersLists = [
    ['pra','par','gar','qar','are','gra','dar','qar','der','ger','gre','bar']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          letters: generateExercise(Q7LettersLists),
          gridSize: 5,
          randomizeList: true,
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

