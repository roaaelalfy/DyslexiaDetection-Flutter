import 'dart:math';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../GenerateRandomExercises.dart';

class Q10Screen extends StatelessWidget {
  Q10Screen({Key? key}): super(key: key,);
  List<List<String>> Q10List = [
    ["create" , "great" , "gate" ,
    "greet" , "crate" , "great" ,
    "greet" , "grade" , "crate"
    ],
    [ "date" , "late" , "deer" ,
      "dear" , "gate" , "ate" ,
      "late" , "door" , "grade"
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          currentScreen: 10,
          letters: generateExercise(Q10List),
          gridSize: 3,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q10Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q11Screen); },
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