import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import 'GenerateRandomLetters1-4.dart';

class Q3Screen extends StatelessWidget {
  Q3Screen({Key? key}): super(key: key,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          gridSize: 5,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q3Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q4Screen); },
        )
    );
  }
}
