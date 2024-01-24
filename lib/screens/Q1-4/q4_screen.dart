import 'package:flutter/material.dart';
import 'GenerateRandomLetters1-4.dart';


class Q4Screen extends StatelessWidget {
  Q4Screen({Key? key}): super(key: key,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget( gridSize: 6,)
    );
  }
}
