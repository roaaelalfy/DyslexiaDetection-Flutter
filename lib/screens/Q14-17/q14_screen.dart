import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'GenerateRandomExercises14-17.dart';

class Q14Screen extends StatelessWidget {
  Q14Screen({Key? key}): super(key: key,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          currentScreen:14,
          gridSize: 5,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q14Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q15Screen); },
        )
    );
  }

}