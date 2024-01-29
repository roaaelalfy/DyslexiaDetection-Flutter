import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:dyslexiadetectorapp/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Q24Screen extends StatefulWidget {
  const Q24Screen({Key? key}) : super(key: key);

  @override
  _Q24ScreenState createState() => _Q24ScreenState();
}

class _Q24ScreenState extends State<Q24Screen> {
  Map<String, List<String>> Q24Map = {
    "affect": ['The','affect','of','the','wind','was','to','cause','the','boat’s','sail','to','billow.'],
    "meet":  ['The','restaurant','offers','a','delicious','meet','dish','for','dinner.'],
    "then": ['There','are','less','girls','in','our','class','then','boys.'],
    "net":['You','must','get','your','neat','for','fishing.'],
  };
  late List<bool> clickedStatus;
  late String randomKey;
  late String selectedKey;
  late List<String> exerciseWords;
  FlutterTts flutterTts = FlutterTts();
  static bool playedSound = false;
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
  final int currentScreen = 24;

  @override
  void initState() {
    super.initState();
    exerciseWords = generateExercise(Q24Map);
    if(!playedSound){
      _initTts();
      loadSound();
    }
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

        Navigator.pushNamed(context, AppRoutes.q25Screen);
      }
    });
  }
  @override
  void dispose() {
    flutterTts.stop();
    _timer.cancel();
    super.dispose();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 22.h),
        child: Column( // Wrap everything in a Column
          children: [
            buildSentence(context), // Add some spacing if needed
           ],
        ),
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


  Widget buildSentence(BuildContext context) {
    return Center(
      child: Container(
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
          Navigator.pushNamed(context, AppRoutes.q25Screen);
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
    // Choose a random key from the map
    List<String> randomKey = map.keys.toList()..shuffle();
    selectedKey = randomKey.first;
    exerciseWords = map[selectedKey]!;

    clickedStatus = List.generate(exerciseWords.length, (index) => false);
    return exerciseWords;
  }

  Future<void> loadSound() async {
    try {
      await flutterTts.speak("Find the wrong word.");
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
