import 'dart:math';

import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:dyslexiadetectorapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class Q30Screen extends StatefulWidget {
  const Q30Screen({Key? key}) : super(key: key);

  @override
  _Q30ScreenState createState() => _Q30ScreenState();
}

class _Q30ScreenState extends State<Q30Screen> {
  List<String> letters = ["p g d j" ,"v h b z q","m d j n p h","i u e o","b q l i","h n w m"];
  late String word;

  @override
  void initState() {
    super.initState();
    word = generateExercise(letters);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.q301Screen ,arguments: {"selectedWord": word});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.maxFinite,
          child: CustomOutlinedButton(
            width: 236.h,
            text: word,
            buttonTextStyle: theme.textTheme.headlineSmall!,
          ),
        ),
      ),
    );
  }

  //Choose random word to generate exercise
  String generateExercise(List<String> sentences) {
    Random random = Random();
    int randomIndex= random.nextInt(sentences.length);
    word = sentences[randomIndex];
    return word;
  }

}
