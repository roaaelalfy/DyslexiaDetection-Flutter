import 'package:flutter/material.dart';
import 'GenerateRandomLetters1-4.dart';

class Q1Screen extends StatelessWidget {
  Q1Screen({Key? key}): super(key: key,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DyslexiaExerciseWidget(gridSize: 3)
    );
  }

 }
