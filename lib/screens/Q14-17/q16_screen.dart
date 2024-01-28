import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'GenerateRandomExercises14-17.dart';

class Q16Screen extends StatelessWidget {
  Q16Screen({Key? key}): super(key: key,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          currentScreen: 16,
          gridSize: 5,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q16Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q17Screen); },
        )
    );
  }

}