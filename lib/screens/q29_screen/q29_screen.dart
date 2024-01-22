import 'dart:math';

import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';

class Q29Screen extends StatefulWidget {
  const Q29Screen({Key? key}) : super(key: key);

  @override
  _Q29ScreenState createState() => _Q29ScreenState();
}

class _Q29ScreenState extends State<Q29Screen> {
  List<String> sentences = ["sheranupthehill" ,"wewantfreedom","whattimeisit?","todayisarainyday","ican'tunderstandthis","hetookthebus"];
  late String sentence;
  List<String> words = [];

  @override
  void initState() {
    super.initState();
    sentence = generateExercise(sentences);
    words = sentence.split('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              words.length,
                  (index) {
                return GestureDetector(
                  onTap: () {
                    separateWords(index.toDouble());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Text(
                      words[index],
                      style: theme.textTheme.headlineSmall!,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  //Choose random list to generate exercise
  String generateExercise(List<String> sentences) {
    Random random = Random();
    int randomIndex= random.nextInt(sentences.length);
    sentence = sentences[randomIndex];
    return sentence;
  }

  void separateWords(double tapPosition) {
    int index = (tapPosition).round();
    if (index >= 0 && index <= words.length) {
      words.insert(index, ' ');
      setState(() {});
    }
  }
}
