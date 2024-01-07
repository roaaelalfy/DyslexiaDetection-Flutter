import 'dart:math';
import 'package:flutter/material.dart';
import '../GenerateRandomLetters.dart';

class Q2Screen extends StatelessWidget {
  Q2Screen({Key? key}): super(key: key,);

  List<List<String>> Q2LettersLists = [
    ['n','m','w' ,'u','h'],
    ['a','e','i','u','o','n','m','w' ,'u','h','g','d','p','q','b'],
    ['g','d','p','q','b'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          letters: generateExercise(Q2LettersLists),
          gridSize: 4,
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
