import 'dart:math';
import 'package:flutter/material.dart';
import 'GenerateRandomLetters1-4.dart';

class Q1Screen extends StatelessWidget {
  Q1Screen({Key? key}): super(key: key,);

  List<List<String>> Q1LettersLists = [
    ['a','e','i','u','o'],
    ['n','m','w' ,'u','h']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DyslexiaExerciseWidget(
        letters: generateExercise(Q1LettersLists),
        gridSize: 3,
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
