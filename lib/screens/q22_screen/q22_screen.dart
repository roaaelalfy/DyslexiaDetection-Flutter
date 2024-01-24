import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'dart:math';

import 'dart:async';

import 'package:percent_indicator/linear_percent_indicator.dart';

class Q22Screen extends StatefulWidget {
  const Q22Screen({Key? key}) : super(key: key);

  @override
  _Q22ScreenState createState() => _Q22ScreenState();
}

class _Q22ScreenState extends State<Q22Screen> {
  List<String> words = ["_ith", "_oat", "me_t", "r_in", "_lum","h_use","bro_n","lang_age"];
  List<String> missingLetters = ["wnmx", "daeb", "adbr", "apeq", "qdpa","aoui","wmxn","nuae"];
  String buttonText = "";
  List<String> selectedLetters = [];
  FlutterTts flutterTts = FlutterTts();
  static bool playedSound = false;
  late int randomIndex;
  late Timer _timer;
  int _timerCount = 25;  // Initial timer count in seconds
  static double progressPercentage = 1.0;
  static bool timerStarted = false;
  @override
  void initState() {
    super.initState();
    _updateWordAndLetters();
    generateRandomLetters();
    if(!playedSound){
    _initTts();
    loadLetterSound();
    }
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
        Navigator.pushNamed(context, AppRoutes.q23Screen);
      }
    });
  }


  @override
  void dispose() {
    flutterTts.stop(); // Stop TTS when disposing the widget
    super.dispose();
  }
  void _updateWordAndLetters() {
    Random random = Random();
    int randomIndex = random.nextInt(words.length);
    setState(() {
      buttonText = words[randomIndex];
      selectedLetters = missingLetters[randomIndex].split('');
    });
  }
  void _updateButtonAndLetters() {
    Random random = Random();
    randomIndex = random.nextInt(words.length);
    setState(() {
      buttonText = words[randomIndex];
      selectedLetters = missingLetters[randomIndex].split('');
    });
  }

  List<String> generateRandomLetters() {
    Random random = Random();
    int randomIndex = random.nextInt(missingLetters.length);
    return missingLetters[randomIndex].split('');
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
            CustomOutlinedButton(
              height: 53.v,
              width: 171.h,
              text: buttonText,
              buttonStyle: CustomButtonStyles.outlineLightBlueTL25,
            ),
            SizedBox(height: 25.v),
            _buildLetterContainers(context, selectedLetters),
            SizedBox(height: 1.v),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width,
                lineHeight: 5.0,
                percent: progressPercentage,
                backgroundColor: Colors.white,
                progressColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildContainer(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        _updateListsAndNavigate();
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

  Widget _buildLetterContainers(BuildContext context, List<String> letters) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: letters.map((letter) => _buildContainer(context, letter)).toList(),
      ),
    );
  }

  void _updateListsAndNavigate() {
    setState(() {
      _updateButtonAndLetters();
      words.removeAt(randomIndex);
      missingLetters.removeAt(randomIndex);
    });

    if (words.isEmpty) {
      // If there are no more questions, navigate to the next screen
      _timer.cancel();
      playedSound = false;
      timerStarted = false;
      Navigator.pushNamed(context, AppRoutes.q23Screen);
    }
  }
  Future<void> loadLetterSound() async{
    // Speak the random letter
    try {
      await flutterTts.speak("Choose the missing letter");
      playedSound = true;
    } catch (e) {
      print("TTS Error: $e");
    }

  }

}

