import 'dart:async';

import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Q25Screen extends StatefulWidget {
  const Q25Screen({Key? key}) : super(key: key);

  @override
  _Q25ScreenState createState() => _Q25ScreenState();
}

class _Q25ScreenState extends State<Q25Screen> {
  Map<String, List<String>> Q25Map = {
    "of": ['Smoking','is','prohibited','of','the','entire','craft.'],
    "them":  ['This','homework','is','so','easy','.  I','can','do','them' ,'in','five','minutes.'],
    "was": ['I','swim','in','the','sea','whenever','the','weather','was','fine.'],
    "were":['When','we','went','shopping','it','were','very','busy.'],
  };
  late List<bool> clickedStatus;
  late List<String> exerciseWords;
  late String selectedKey;
  late FlutterTts flutterTts =FlutterTts();
  late Timer _timer;
  int _timerCount = 25;  // Initial timer count in seconds
  static double progressPercentage = 1.0;
  static bool timerStarted = false;

  // performance measures
  static int clicks =0;
  static int hits =0;
  static int misses =0;
  static int score =0;
  static double accuracy =0;
  static double missrate =0;
  final int currentScreen = 25;

  @override
  void initState() {
    super.initState();
    exerciseWords=[];
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
      await loadSound("Find the wrong word.");
      exerciseWords = generateExercise(Q25Map);
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
        // calculate missrate ,score, accuracy and update database.
        missrate = misses / clicks;
        accuracy = hits / clicks;
        score = hits;
        Navigator.pushNamed(context, AppRoutes.q26Screen);
      }
    });
  }


  @override
  void dispose() {
    flutterTts.stop();
    _timer.cancel();
    timerStarted=false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 22.h),
        child: buildSentence(context),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child:LinearPercentIndicator(
          width:MediaQuery.of(context).size.width,
          lineHeight: 5.0,
          percent: progressPercentage,
          backgroundColor: Colors.white,
          progressColor: Colors.blue,
        ),
      ),
    );
  }

  Widget buildSentence(BuildContext context) {
    return Container(
      width: 349.h,
      padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 100.v),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Container(
            width: 326.h,
            margin: EdgeInsets.only(right: 8.h),
            child: Wrap(
              spacing: 8.h,
              children: List.generate(
                exerciseWords.length,
                    (index) => _buildWord(context, exerciseWords[index], index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWord(BuildContext context, String selectedWord, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          clickedStatus[index] = !clickedStatus[index];
          clicks++;
          // store the selected word and navigate
          if(selectedWord == selectedKey){
            hits++;
          }else{
            misses++;
          }
          Navigator.pushNamed(context, AppRoutes.q26Screen);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
        child: Text(
          selectedWord,
          style: CustomTextStyles.headlineSmallInika.copyWith(
            color: clickedStatus[index] ? appTheme.lightBlue100 : appTheme.black900,
          ),
        ),
      ),
    );
  }

  //Choose random list to generate exercise
  List<String> generateExercise(Map<String, List<String>> map) {
    List<String> myExercise =[];
    // Choose a random key from the map
    List<String> randomKey = map.keys.toList()..shuffle();
    selectedKey = randomKey.first;
    myExercise = map[selectedKey]!;

    clickedStatus = List.generate(myExercise.length, (index) => false);
    return myExercise;
  }
  Future<void> loadSound(String text) async {
    try {
      await flutterTts.speak(text);
    } catch (e) {
      print("TTS Error: $e");
    }
  }

}
