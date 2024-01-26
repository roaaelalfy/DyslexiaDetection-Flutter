import 'dart:async';

import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class Q26Screen extends StatefulWidget {
  const Q26Screen({Key? key}) : super(key: key);

  @override
  _Q26ScreenState createState() => _Q26ScreenState();
}

class _Q26ScreenState extends State<Q26Screen> {
  List<Map<String, dynamic>> listOfMaps = [
    {'b': "webnesday"},
    {'e': "fridey"},
    {'w': "nuwber"},
    {'i': "iacket"},
    {'n': "npset"},
    {'e': "Triel"},
    {'E':"Elash"},
    {'e':"goel"}
  ];
  List<String> possibleWrongLetters = ["dbay", "daqp", "xmnu", "jegp","uaeo","uaio","FTLI","aouh"];
  List<String> testWord = [];
  static late int randomIndex;
  FlutterTts flutterTts = FlutterTts();
  static bool playedSound = false;

  late Timer _timer;
  int _timerCount = 25;  // Initial timer count in seconds
  static double progressPercentage = 1.0;
  static bool timerStarted = false;

  @override
  void initState() {
    super.initState();
    _initExercise();
    randomIndex=0;
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
    await _initTts();
    if(!playedSound) {
      await loadSound("Replace the wrong letter.");
    }
    _generateRandomIndex();
    _generateRandomTestWord();
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
        playedSound = false;
        timerStarted = false;
        Navigator.pushNamed(context, AppRoutes.q27Screen);
      }
    });
  }
  @override
  void dispose() {
    flutterTts.stop();
    _timer.cancel();
    playedSound = false;
    super.dispose();
  }
  String getKey() {
    return listOfMaps[randomIndex].keys.first;
  }
  void _generateRandomIndex() {
    Random random = Random();
    randomIndex = random.nextInt(listOfMaps.length);
    print("randomIndex $randomIndex");
  }

  void _generateRandomTestWord() {
    testWord = listOfMaps[randomIndex].values.first.split('');
  }
  List<String> generateRandomLetters() {
    return possibleWrongLetters[randomIndex].split('');
  }
  @override
  Widget build(BuildContext context) {
    print(listOfMaps);
    print(possibleWrongLetters);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 72.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < testWord.length; i++)
                  Text(
                    testWord[i],
                    style: TextStyle(
                      color: (testWord[i] == getKey()) ? Colors.lightBlue : appTheme.black900,
                      fontSize: 30,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 25.v),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < generateRandomLetters().length; i++)
                  _buildContainer(context, generateRandomLetters()[i], i),
              ],
            ),
          ],
        ),
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
  Widget _buildContainer(BuildContext context, String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Remove the key-value pair from listOfMaps
          listOfMaps.removeAt(randomIndex);

          // Remove the corresponding wrong letters from possibleWrongLetters
          possibleWrongLetters.removeAt(randomIndex);

          // Reload question with new random letter
          _generateRandomIndex();
          _generateRandomTestWord();
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
  Future<void> loadSound(String text) async{
    // Speak the random letter
    try {
      await flutterTts.speak(text);
      playedSound = true;
    } catch (e) {
      print("TTS Error: $e");
    }

  }
}


