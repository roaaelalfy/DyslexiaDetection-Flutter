import 'dart:async';
import 'dart:math';

import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Q29Screen extends StatefulWidget {
  const Q29Screen({Key? key}) : super(key: key);

  @override
  _Q29ScreenState createState() => _Q29ScreenState();
}

class _Q29ScreenState extends State<Q29Screen> {
  List<String> sentences = ["sheranupthehill" ,"wewantfreedom","whattimeisit?","todayisarainyday","ican'tunderstandthis","hetookthebus"];
  late String sentence;
  List<String> words = [];
  FlutterTts flutterTts = FlutterTts();

  late Timer _timer;
  int _timerCount = 25; // Initial timer count in seconds
  static double progressPercentage = 1.0;
  static bool timerStarted = false;

  @override
  void initState() {
    super.initState();
    _initExercise();

    // start timer after the sound is played to start the test
    print("timerStarted $timerStarted");
    if (timerStarted == false) {
      _startTimer();
    }
  }
    Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.4);
  }
  Future<void> _initExercise() async {
    _initTts();
    loadSound();
    sentence = generateExercise(sentences);
    words = sentence.split('');
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print("Counter: $_timerCount percentage: $progressPercentage");
      if (_timerCount > 0) {
        setState(() {
          _timerCount--;
          progressPercentage = _timerCount / 25.0;
          timerStarted = true;
        });
      } else {
        // Timer is over, navigate to the next screen
        _timer.cancel(); // to restart timer in the new screen
        timerStarted = false;
        Navigator.pushNamed(context, AppRoutes.q30Screen);
      }
    });
  }
  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                      padding: EdgeInsets.symmetric(vertical: 200.v),
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
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child:LinearPercentIndicator(
          width: 300,
          lineHeight: 5.0,
          percent: progressPercentage,
          backgroundColor: Colors.white,
          progressColor: Colors.blue,
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


  Future<void> loadSound() async {
    try {
      await flutterTts.speak("Separate the words to form a useful sentence ");
    } catch (e) {
      print("TTS Error: $e");
    }
  }
}
