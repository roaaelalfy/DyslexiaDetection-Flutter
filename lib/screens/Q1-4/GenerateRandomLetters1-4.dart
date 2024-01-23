import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dart:math';

class DyslexiaExerciseWidget extends StatefulWidget {
  final int gridSize;

  DyslexiaExerciseWidget({required this.gridSize});

  @override
  State<DyslexiaExerciseWidget> createState() => _DyslexiaExerciseWidgetState();
}

class _DyslexiaExerciseWidgetState extends State<DyslexiaExerciseWidget> {
  List<String>? exerciseLetters;
  static bool playedSound = false;
  static String? randomLetter;
  late FlutterTts flutterTts;
  late Timer _timer;
  Random random = Random();
  int _timerCount = 25;  // Initial timer count in seconds
  static double progressPercentage = 1.0;
  static bool timerStarted = false;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _initExercise();

    // start timer after the sound is played to start the test
    print("timerStarted $timerStarted");
    if (timerStarted== false) {
      _startTimer();
    }
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.2);
  }

  Future<void> _initExercise() async {
    randomLetter ??= String.fromCharCode(random.nextInt(26) + 'a'.codeUnitAt(0));
    print("playedSound: $playedSound");
    // ensures the sound is played only once at the beginning of the exercise
    if (!playedSound) {
      await _initTts();
      await loadLetterSound(randomLetter!);
    }
    exerciseLetters = generateExercise(widget.gridSize);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print("Counter: $_timerCount percentage: $progressPercentage");
      if (_timerCount > 0) {
        setState(() {
          _timerCount--;
          progressPercentage= _timerCount/25.0;
          timerStarted = true;
        });
      } else {
        // Timer is over, navigate to the next screen
        _timer.cancel();  // to restart timer in the new screen
        randomLetter = null;
        playedSound = false;
        timerStarted = false;
        Navigator.pushReplacementNamed(context, AppRoutes.q3Screen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    exerciseLetters ??= generateExercise(widget.gridSize);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 220.h, vertical: 70.v),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.gridSize,
                  childAspectRatio: 1.05,
                ),
                itemCount: exerciseLetters!.length,
                itemBuilder: (context, index) {
                  return _buildGridTile(exerciseLetters![index]);
                },
              ),
            ),
          ),
          LinearPercentIndicator(       // Linear progress bar
            width: MediaQuery.of(context).size.width,
            lineHeight: 5.0,
            percent: progressPercentage,  // Calculate the percentage based on timer count
            backgroundColor: Colors.white,
            progressColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildGridTile(String letter) {
    return GestureDetector(
      child: Card(
        elevation: 6,
        child: Container(
          child: Center(
            child: Text(
              letter,
              style: TextStyle(fontSize: 18.0,),
            ),
          ),
        ),
      ),
      onTap: () {
        // save the # clicks , misses , hits then reload the screen
        Navigator.pushNamed(context, AppRoutes.q2Screen);
      },
    );
  }

  List<String> generateExercise(int gridSize) {
    List<String> myExerciseLetters = [];
    myExerciseLetters.add(randomLetter!);

    for (int i = 0; i < gridSize * gridSize - 1; i++) {
      myExerciseLetters.add(String.fromCharCode(random.nextInt(26) + 'a'.codeUnitAt(0)));
    }
    myExerciseLetters.shuffle();
    return myExerciseLetters;
  }

  Future<void> loadLetterSound(String _randomLetter) async {
    try {
      await flutterTts.speak("Choose $_randomLetter");
      playedSound = true;
    } catch (e) {
      print("TTS Error: $e");
    }
  }
}
