import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:dyslexiadetectorapp/firestore_services.dart';
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
  // List<Map<String, String>> words = [
  //   {'w': "_ith"},
  //   {'b': "_oat"},
  //   {'a':"r_in"},
  //   {'p':"_lum"},
  //   {'e':"hous_"},
  //   {'o':"br_wn"},
  //   {'n':"_ature"},
  //   {'u':"lang_age"},
  //   {'d':"brea_"},
  // ];
  static Map<String, List<String>> words = {
    'w': ["_ith"],
    'b': ["_oat"],
    'a': ["r_in"],
    'p': ["_lum"],
    'e': ["hous_"],
    'o': ["br_wn"],
    'n': ["_ature"],
    'u': ["lang_age"]
  };
  List<String> missingLetters = ["wnmx", "daeb", "adbr", "apeq","aeui","oeau","nuea","eaui","qbdc"];
  static int clicks =0;
  static int hits =0;
  static int misses =0;
  static int score =0;
  static double accuracy =0;
  static double missrate =0;
  final FirestoreService firestoreService = FirestoreService();

  final int currentScreen =22;

  String buttonText="";
  late String randomKey;
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
        // calculate missrate ,score, accuracy and update database.
        missrate = misses / clicks;
        print("missrate:$missrate");
       accuracy = hits / clicks;
       print("accuracy:$accuracy");
        score = hits;
        print("score:$score");
        //update database
        updateDatabase(currentScreen);
        //reset performance measures
        clicks=0;
        hits=0;
        misses=0;
        missrate=0;
        accuracy=0;
        score=0;
        Navigator.pushNamed(context, AppRoutes.q23Screen);
      }
    });
  }


  @override
  void dispose() {
    flutterTts.stop(); // Stop TTS when disposing the widget
    super.dispose();
    clicks=0;
    hits=0;
    misses=0;
    missrate=0;
    accuracy=0;
    score=0;
  }
  void _updateWordAndLetters() {
      Random random = Random();
      randomIndex = random.nextInt(words.length);
      randomKey = words.keys.elementAt(randomIndex);
      //Map<String, String> currentWord = words[randomIndex];
      //buttonText = currentWord.values.first;

     // randomKey = words[randomIndex].keys.first;
      setState(() {
        buttonText = words[randomKey]![0];
        selectedLetters = missingLetters[randomIndex].split('');
      });


  }
  // void _updateWordAndLetters() {
  //   Random random = Random();
  //   randomIndex = random.nextInt(words.length);
  //   currentKey = words.keys.elementAt(randomIndex);
  //
  //   setState(() {
  //     buttonText = words[currentKey]![0];
  //     selectedLetters = missingLetters[randomIndex].split('');
  //   });
  // }

  // void _updateButtonAndLetters() {
  //   Random random = Random();
  //   randomIndex = random.nextInt(words.length);
  //   randomKey = words.keys.elementAt(randomIndex);
  //   setState(() {
  //     buttonText = words[randomKey]![0];
  //     selectedLetters = missingLetters[randomIndex].split('');
  //   });
  // }

  List<String> generateRandomLetters() {
    Random random = Random();
    int randomIndex = random.nextInt(missingLetters.length);
    return missingLetters[randomIndex].split('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 72.h, vertical: 150.v),
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
              _buildLetterContainers(context,selectedLetters),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
    child:SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    children: [
    Container(
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
      ),
    );
  }
  Widget _buildContainer(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
       // words.removeAt(randomIndex);
        //missingLetters.removeAt(randomIndex);
        // save the # clicks , misses , hits then reload the screen
         clicks++;
         print("clicks:$clicks");
         print("text:$text");
         print("buttonText:$randomKey");
        // print("Index:$randomIndex");
        if(text==randomKey){
         hits++;
         print("hits:$hits");
        }else{misses++;print("misses:$misses");}
         _removeCurrentWord();
         _updateWordAndLetters();
         Navigator.pushNamed(context, AppRoutes.q22Screen);
        // setState(() {
        //   _updateListsAndNavigate();
        //   // words.remove(randomKey);
        //   // missingLetters.removeAt(randomIndex);
        //   // _updateWordAndLetters();
        //   // Navigator.pushNamed(context, AppRoutes.q22Screen);
        //
        // });

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

  Widget _buildLetterContainers(BuildContext context,List<String>letters) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:letters.map((letter) => _buildContainer(context, letter)).toList(),
      ),
    );
  }
  // void _updateListsAndNavigate() {
  //   _removeCurrentWord();
  //   //setState(() {
  //     //words.removeWhere((word) => word.keys.first == randomKey);
  //    // missingLetters.removeAt(randomIndex);
  //   //});
  //
  //   _updateWordAndLetters();
  //
  //   Navigator.pushNamed(context, AppRoutes.q22Screen);
  // }
  void _removeCurrentWord() {
    setState(() {
      words.remove(randomIndex);
      missingLetters.removeAt(randomIndex);
    });
  }
  // void _updateListsAndNavigate() {
  //    setState(() {
  //      // Remove elements from the copies
  //      words.removeAt(randomIndex);
  //      missingLetters.removeAt(randomIndex);
  //      _updateWordAndLetters();
  //
  //    });
  //
  //      Navigator.pushNamed(context, AppRoutes.q22Screen);
  //  }
  Future<void> loadLetterSound() async{
    // Speak the random letter
    try {
      await flutterTts.speak("Choose the missing letter");
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

