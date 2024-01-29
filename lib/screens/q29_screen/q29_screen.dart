import 'dart:async';
import 'dart:math';

import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:dyslexiadetectorapp/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Q29Screen extends StatefulWidget {
  const Q29Screen({Key? key}) : super(key: key);

  @override
  _Q29ScreenState createState() => _Q29ScreenState();
}

class _Q29ScreenState extends State<Q29Screen> {
  List<String> sentences = ["sheranupthehill", "wewantfreedom", "whattimeisit?", "todayisarainyday", "ican'tunderstandthis", "hetookthebus"];
  List<List<int>> spacesIndices = [
    [3, 6, 9, 13],
    [2, 6],
    [4, 8, 10],
    [5, 7, 8, 13],
    [1, 6, 16],
    [2, 7, 9]
  ];
  late String sentence;
  List<String> letters = [];
  FlutterTts flutterTts = FlutterTts();
  late int randomIndex;

  late Timer _timer;
  double _timerCount = 25.0; // Initial timer count in seconds
  double progressPercentage = 1.0;
  bool timerStarted = false;
  bool soundPlayed = false;

  final FirestoreService firestoreService = FirestoreService();

  // performance measures
  int clicks = 0;
  int hits = 0;
  int misses = 0;
  int score = 0;
  double accuracy = 0;
  double missrate = 0;
  final int currentScreen = 29;

  @override
  void initState() {
    super.initState();
    _initTts();
    _initExercise();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.2);
  }

  Future<void> _initExercise() async {
    // Load sound and set soundPlayed to true when it's completed
    await loadSound();
    sentence = generateExercise(sentences);
    letters = sentence.split('');
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print("Counter: $_timerCount percentage: $progressPercentage");
      if (_timerCount > 0) {
        setState(() {
          progressPercentage = _timerCount / 25.0;
          _timerCount--;
          timerStarted = true;
        });
      } else {
        // Timer is over, navigate to the next screen
        _timer.cancel(); // to restart timer in the new screen
        // calculate missrate, score, accuracy and update database.
        missrate = misses / clicks;
        accuracy = hits / clicks;
        score = hits;
        updateDatabase(currentScreen);

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
          if (soundPlayed)
            Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  letters.length,
                      (index) {
                    return GestureDetector(
                      onTap: () {
                        clicks++;
                        separateWords(index.toDouble());
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 200.v),
                        child: Text(
                          letters[index],
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
        child: LinearPercentIndicator(
          width: MediaQuery.of(context).size.width,
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
    randomIndex = random.nextInt(sentences.length);
    sentence = sentences[randomIndex];
    return sentence;
  }

  void separateWords(double tapPosition) {
    int index = (tapPosition).round();
    if (index >= 0 && index <= letters.length) {
      String clickedLetter = letters[index];
      // check if the clicked index corresponds/exists in the expected spaces indices
      if (spacesIndices[randomIndex].contains(index)) {
        hits++;
      } else {
        misses++;
      }
      letters.insert(index, ' ');
      // update spaces indices with every white space
      spacesIndices[randomIndex] = spacesIndices[randomIndex].map((value) => value + 1).toList();
      setState(() {});
    }
  }

  Future<void> loadSound() async {
    try {
      await flutterTts.speak("Separate the words to form a useful sentence ");
      // Start the timer only when the sound is played completely
      soundPlayed = true;
        _startTimer();
      } catch (e) {
      print("TTS Error: $e");
    }
  }
  Future<void> updateDatabase(int currentScreen) async{
    await firestoreService.addScreenDataForPlayer({
      'clicks$currentScreen': clicks,
      'hits$currentScreen': hits,
      'miss$currentScreen': misses,
      'score$currentScreen': score,
      'accuracy$currentScreen': accuracy,
      'missrate$currentScreen': missrate,
    });
  }
}
