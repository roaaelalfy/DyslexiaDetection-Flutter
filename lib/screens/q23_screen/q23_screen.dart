import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';
import'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'dart:async';
import 'package:percent_indicator/linear_percent_indicator.dart';
class Q23Screen extends StatefulWidget {
  const Q23Screen({Key? key}) : super(key: key);

  @override
  _Q23ScreenState createState() => _Q23ScreenState();
}

class _Q23ScreenState extends State<Q23Screen> {
  List<String> letters = ["Soame","Aweasome","goaod","Hapqpy","boax","Handsoame","Beaeutiful"];
  late List<String>characters;
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
    _generateRandomWord();
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
        Navigator.pushNamed(context, AppRoutes.q24Screen);
      }
    });
  }
  @override
  void dispose() {
    flutterTts.stop(); // Stop TTS when disposing the widget
    super.dispose();
  }
  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.2);
  }
  void _generateRandomWord() {
    randomIndex = _generateRandomIndex();
    // Get the word at the random index
    String randomWord = letters[randomIndex];
    characters = randomWord.split('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 38.h),
          child: buildWord(context),),
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
    );
  }

  Widget buildWord(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 11.v),
      decoration: AppDecoration.outlineLightblue10001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          characters.length,
              (index) => Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: InkWell(
              onTap: () {
                setState(() {
                  characters.removeAt(index);
                  letters.removeAt(randomIndex);
                  // Generate a new random word
                  _generateRandomWord();
                  if (characters.isEmpty) {
                    // If the characters list is empty, generate a new random word
                    _generateRandomWord();
                  }

                });
              },
              child: Text(
                characters[index],
                style: CustomTextStyles.headlineSmallInika,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to generate a random index
  int _generateRandomIndex() {
    return Random().nextInt(letters.length);
  }
  Future<void> loadLetterSound() async{
    // Speak the random letter
    try {
      await flutterTts.speak("Remove the extra letter");
      playedSound = true;
    } catch (e) {
      print("TTS Error: $e");
    }

  }

}
