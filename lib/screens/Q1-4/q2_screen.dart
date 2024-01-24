import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import 'GenerateRandomLetters1-4.dart';

class Q2Screen extends StatelessWidget {
  Q2Screen({Key? key}): super(key: key,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          gridSize: 4,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q2Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q3Screen); },
        )
    );
  }
}
