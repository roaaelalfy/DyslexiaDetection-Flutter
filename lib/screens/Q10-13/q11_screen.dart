import 'dart:math';
import 'package:flutter/material.dart';

import '../GenerateRandomExercises.dart';

class Q11Screen extends StatelessWidget {
  Q11Screen({Key? key}): super(key: key,);
  List<List<String>> Q11List = [
    ["meet" , "greet" , "great" ,"sweet"
    "seat" , "meet" , "mate" , "neat",
    "sweet" , "grade" , "crate" , "greet",
    "greet" , "neat" , "seat" , "grade",
    ],
    ["blue" , "true" , "you" ,"view"
    "crew" , "you" , "glue" , "shoe",
    "glue" , "clue" , "crew" , "true",
    "true" , "blue" , "knew" , "glue"
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          letters: generateExercise(Q11List),
          gridSize: 4,
          randomizeList: false,
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
