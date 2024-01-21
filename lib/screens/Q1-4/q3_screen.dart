import 'dart:math';
import 'package:flutter/material.dart';
import '../GenerateRandomExercises.dart';

class Q3Screen extends StatelessWidget {
  Q3Screen({Key? key}): super(key: key,);

  List<List<String>> Q3LettersLists = [
    ['a','e','i','u','o','n','m','w' ,'u','h','g','d','p','q','b'],
    ['n','m','w' ,'u','h'],
    ['g','d','p','q','b'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          letters: generateExercise(Q3LettersLists),
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
