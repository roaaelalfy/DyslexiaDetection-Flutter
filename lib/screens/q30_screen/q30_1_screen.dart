import 'dart:async';
import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:dyslexiadetectorapp/services/firestore_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Q301Screen extends StatefulWidget {
  const Q301Screen({Key? key}) : super(key: key);

  @override
  State<Q301Screen> createState() => _Q301ScreenState();
}

class _Q301ScreenState extends State<Q301Screen> {
  List<String> pressedLetters = [];
  late List<String> correctWord=[];

  final FirestoreService firestoreService = FirestoreService();

  late Timer _timer;
  int _timerCount = 25; // Initial timer count in seconds
  static double progressPercentage = 1.0;
  static bool timerStarted = false;
  static int clicks =0;
  static int hits =0;
  static int misses =0;
  static int score =0;
  static double accuracy =0;
  static double missrate =0;
  final int currentScreen = 30;

  @override
  void initState() {
    super.initState();
    // start timer after the sound is played to start the test
    print("timerStarted $timerStarted");
    if (timerStarted == false) {
      _startTimer();
    }
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
        // calculate missrate ,score, accuracy and update database.
        missrate =misses / clicks;
        accuracy =hits / clicks;
        score = hits;
        //update database

        updateDatabase(currentScreen);
        //reset performance measures
        clicks=0;
        hits=0;
        misses=0;
        missrate=0;
        accuracy=0;
        score=0;
        Navigator.pushNamed(context, AppRoutes.q31Screen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)!.settings.arguments as Map;
    //retrieve correct word from previous screen
    correctWord = args["selectedWord"].split(' ');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 58.v,
              width: double.maxFinite,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildContainer(context, "q"),
                    _buildContainer(context, "w"),
                    _buildContainer(context, "e"),
                    _buildContainer(context, "r"),
                    _buildContainer(context, "t"),
                    _buildContainer(context, "y"),
                    _buildContainer(context, "u"),
                    _buildContainer(context, "i"),
                    _buildContainer(context, "o"),
                    _buildContainer(context, "p"),
                  ],
                ),
                SizedBox(height: 6.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(width: 15.h),
                    _buildContainer(context, "a"),
                    _buildContainer(context, "s"),
                    _buildContainer(context, "d"),
                    _buildContainer(context, "f"),
                    _buildContainer(context, "g"),
                    _buildContainer(context, "h"),
                    _buildContainer(context, "j"),
                    _buildContainer(context, "k"),
                    _buildContainer(context, "l"),
                  ],
                ),
                SizedBox(height: 6.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 35.h),
                    _buildContainer(context, "z"),
                    _buildContainer(context, "x"),
                    _buildContainer(context, "c"),
                    _buildContainer(context, "v"),
                    _buildContainer(context, "b"),
                    _buildContainer(context, "n"),
                    _buildContainer(context, "m"),
                    SizedBox(width: 30.h),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child:SingleChildScrollView(
          scrollDirection: Axis.horizontal,
        child:LinearPercentIndicator(
          width: MediaQuery.of(context).size.width,
          lineHeight: 5.0,
          percent: progressPercentage,
          backgroundColor: Colors.white,
          progressColor: Colors.blue,
        ),
      ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {

        print("pressed:$pressedLetters");print("correct:$correctWord");
        setState(() {
          pressedLetters.add(text);
          clicks++;
          print("clicks:$clicks");
          if(pressedLetters.length==correctWord.length){

            if (listEquals(pressedLetters, correctWord)) {
              hits++;
              print("hits:$hits");
            } else {
              misses++;
              print("misses:$misses");
            }
            Navigator.pushNamed(context, AppRoutes.q31Screen);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.v),
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
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
