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
  int randomIndex=0;
  FlutterTts flutterTts = FlutterTts();

  late Timer _timer;
  int _timerCount = 25;  // Initial timer count in seconds
  static double progressPercentage = 1.0;
  static bool timerStarted = false;

  @override
  void initState() {
    super.initState();
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
    await _initTts();
    await loadSound("Remove the wrong letter.");
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
        timerStarted = false;
        Navigator.pushNamed(context, AppRoutes.q27Screen);
      }
    });
  }
  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }
  String getKey() {
    return listOfMaps[randomIndex].keys.first;
  }
  void _generateRandomIndex() {
    Random random = Random();
    randomIndex = random.nextInt(listOfMaps.length);
  }

  void _generateRandomTestWord() {
    testWord = listOfMaps[randomIndex].values.first.split('');
  }
  List<String> generateRandomLetters() {
    return possibleWrongLetters[randomIndex].split('');
  }
  @override
  Widget build(BuildContext context) {
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

  Widget _buildContainer(BuildContext context, String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Replace the letter at the specific index with the tapped letter
          testWord[testWord.indexOf(getKey())] = text;
          listOfMaps.removeAt(randomIndex);
          possibleWrongLetters.removeAt(randomIndex);
        });
        // reload question until the timer is over
        Navigator.pushNamed(context, AppRoutes.q26Screen);
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
    } catch (e) {
      print("TTS Error: $e");
    }

  }
}


