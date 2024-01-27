import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../GenerateRandomExercises.dart';

class Q13Screen extends StatelessWidget {
  Q13Screen({Key? key}): super(key: key,);
  List<String> Q13List =
    ["fly" , "dye" , "tie" ,"fight" , "flight" , "night",
      "rye" , "shy" , "cheat" , "chase",  "meat" ,"red",
      "yield" , "shed" , "sat" , "dress" , "dish","shred",
      "red" , "men" , "read" , "need" , "net", "note",
      "neat" , "meat" , "yield" , "deal" , "read" ,"shed",
      "night" , "dye" , "diet" , "deal" , "tight" , "shy"
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DyslexiaExerciseWidget(
          currentScreen: 13,
          letters: Q13List,
          gridSize: 6,
          onTapFunction: (BuildContext context) { Navigator.pushNamed(context, AppRoutes.q13Screen);},
          navigateToNextScreen: (BuildContext context) {Navigator.pushNamed(context, AppRoutes.q14Screen); },
        )
    );
  }
}