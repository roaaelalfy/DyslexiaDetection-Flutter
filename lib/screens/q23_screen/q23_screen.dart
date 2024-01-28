import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:dyslexiadetectorapp/firestore_services.dart';
import 'package:flutter/material.dart';
import'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'package:percent_indicator/linear_percent_indicator.dart';
class Q23Screen extends StatefulWidget {
  const Q23Screen({Key? key}) : super(key: key);

  @override
  _Q23ScreenState createState() => _Q23ScreenState();
}

class _Q23ScreenState extends State<Q23Screen> {
  List<Map<String, dynamic>> words = [
    {'some': "Soame"},
    {'school': "schowol"},
    {'Awesome': "Aweasome"},
    {'good': "goaod"},
    {'icecream': "icekcream"},
    {'Happy': "Hapqpy"},
    {'box':"boax"},
    {'dessert':"desserft"},
    {'Handsome':"Handsoame"},
    {'doctor':"doctoer"},
    {'Beautiful':"Beaeutiful"},
    {'adventure':"advenbture"},
    {'train':"trayin"},
    {'computer':"comdputer"},
    {'shelvs':"shelgves"},
    {'rainbow':"raeinbow"},
    {'house':"houise"},
    {'forrest':"forrrest"},
  ];
  late List<String>characters;
  FlutterTts flutterTts = FlutterTts();
  static bool playedSound = false;

  Random random = Random();
  late int randomIndex;
  late Timer _timer;
  int _timerCount = 25;  // Initial timer count in seconds
  static double progressPercentage = 1.0;
  static bool timerStarted = false;

  final FirestoreService firestoreService = FirestoreService();
  // performance measures
  static int clicks =0;
  static int hits =0;
  static int misses =0;
  static int score =0;
  static double accuracy =0;
  static double missrate =0;
  final int currentScreen =23;

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
        // calculate missrate ,score, accuracy and update database.
        missrate = misses / clicks;
        accuracy = hits / clicks;
        score = hits;

        updateDatabase(currentScreen);

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
    randomIndex = random.nextInt(words.length);
    characters = words[randomIndex].values.first.split('');
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
          child: buildWord(context),
        ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child:LinearPercentIndicator(
          width: MediaQuery.of(context).size.width,
          lineHeight: 5.0,
          percent: progressPercentage,
          backgroundColor: Colors.white,
          progressColor: Colors.blue,
        ),
      ),
    );
  }

  Widget buildWord(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1),
      padding: EdgeInsets.symmetric(horizontal: 31, vertical: 11),
      decoration: AppDecoration.outlineLightblue10001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          characters.length,
              (index) => Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: InkWell(
              onTap: () {
                setState(() {
                  clicks++;
                  characters.removeAt(index);
                  if(characters.join() == words[randomIndex].keys.first){
                    hits++;
                  }else{
                    misses++;
                  }
                  words.removeAt(randomIndex);
                  // Generate a new random word
                  _generateRandomWord();
                  if (characters.isEmpty) {
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
  Future<void> loadLetterSound() async{
    // Speak the random letter
    try {
      await flutterTts.speak("Remove the extra letter");
      playedSound = true;
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
