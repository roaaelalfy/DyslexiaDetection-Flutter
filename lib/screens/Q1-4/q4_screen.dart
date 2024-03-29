import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import 'GenerateRandomLetters1-4.dart';


class Q4Screen extends StatelessWidget {
  Q4Screen({Key? key}): super(key: key,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          currentScreen: 4,
          gridSize: 6,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q4Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q5Screen); },
        )
    );
  }
}
