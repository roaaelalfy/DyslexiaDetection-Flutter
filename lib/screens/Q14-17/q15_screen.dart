import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'GenerateRandomExercises14-17.dart';

class Q15Screen extends StatelessWidget {
  Q15Screen({Key? key}): super(key: key,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          currentScreen: 15,
          gridSize: 5,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q15Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q16Screen); },
        )
    );
  }

}