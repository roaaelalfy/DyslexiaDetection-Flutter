import 'dart:async';
import 'dart:core';
import 'dart:math';
import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Q28Screen extends StatefulWidget {
  const Q28Screen({Key? key}) : super(key: key);

  @override
  State<Q28Screen> createState() => _Q28ScreenState();
}

class _Q28ScreenState extends State<Q28Screen> {
  List<String> words = [
    'beautiful',
    'diamond',
    'enemy',
    'computer',
    'dinosaur',
    'biography',
    'mysterious'
  ];
  List<String> wordSyllables = [
    'beau ti ful',
    'di a mond',
    'en em y',
    'com pu ter',
    'di no saur',
    'bi o graph y',
    'my ste ri ous'
  ];
  late String selectedWord;
  late List<String> shuffledSyllables;
  late int syllablesCount;

  late List<String> pressedLetters = [];
  late String correctWord = selectedWord;
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
    separateAndShuffleLetters();
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
        Navigator.pushNamed(context, AppRoutes.q28Screen);
      }
    });
  }

  @override
  void dispose() {
    flutterTts.stop(); // Stop TTS when disposing the widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 88.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 58.v,
              width: 149.h,
              margin: EdgeInsets.only(right: 18.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(25.h),
                border: Border.all(
                  color: appTheme.lightBlue10001,
                  width: 1.h,
                ),
              ),
              child: Center(
                child: Text(
                  pressedLetters.join(),
                  style: CustomTextStyles.headlineSmallInika.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.v),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                for (String letter in shuffledSyllables)
                  _buildContainer(context, letter),
              ],
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
      ),
    );
  }

  Widget _buildContainer(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        shuffledSyllables.remove(text);
        setState(() {
          pressedLetters.add(text);
          if (pressedLetters.length == syllablesCount) {
            Navigator.pushNamed(context, AppRoutes.q28Screen);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(6.h, 4.h, 0, 0),
        padding: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 6.v,
        ),
        decoration: AppDecoration.outlineLightBlue,
        child: Text(
          text,
          style: CustomTextStyles.headlineSmallInika.copyWith(
            color: appTheme.black900,
          ),
        ),
      ),
    );
  }

  void separateAndShuffleLetters() {
    selectedWord = words[Random().nextInt(words.length)];
    int syllablesListIndex = words.indexOf(selectedWord);
    shuffledSyllables = wordSyllables[syllablesListIndex].split(' ')
      ..shuffle();
    syllablesCount = shuffledSyllables.length;
  }

  Future<void> loadSound() async {
    try {
      await flutterTts.speak("Rearrange to form a word ");
    } catch (e) {
      print("TTS Error: $e");
    }
  }
}
