import 'dart:async';
import 'dart:math';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DyslexiaExerciseWidget extends StatefulWidget {
  final int currentScreen;
  final int gridSize;
  final void Function(BuildContext context) onTapFunction;
  final void Function(BuildContext context) navigateToNextScreen;

  DyslexiaExerciseWidget({
    required this.gridSize,
    required this.onTapFunction,
    required this.navigateToNextScreen,required this.currentScreen});


  @override
  State<DyslexiaExerciseWidget> createState() => _DyslexiaExerciseWidgetState();}


class _DyslexiaExerciseWidgetState extends State<DyslexiaExerciseWidget> {
  late List<String> exerciseletters;
  Random random = Random();
  late String selectedKey;

  late FlutterTts flutterTts =FlutterTts();
  static bool playedSound = false;

  late Timer _timer;
  int _timerCount = 25;  // Initial timer count in seconds
  static double progressPercentage = 1.0;
  static bool timerStarted = false;
  static int clicks =0;
  static int hits =0;
  static int misses =0;
  static int score =0;
  static double accuracy =0;
  static double missrate =0;
  static Map<String, List<String>> Q14To17Map = {
    "F": List.filled(12, 'E') + ['F'] + List.filled(12, 'E'),
    "E": List.filled(12, 'F') + ['E'] + List.filled(12, 'F'),
    "p": List.filled(12, 'q') + ['p'] + List.filled(12, 'q'),
    "b": List.filled(12, 'p') + ['b'] + List.filled(12, 'p'),
    "u": List.filled(12, 'n') + ['u'] + List.filled(12, 'n'),
    "n": List.filled(12, 'u') + ['n'] + List.filled(12, 'u'),
    "h": List.filled(12, 'n') + ['h'] + List.filled(12, 'n'),
    "d": List.filled(12, 'b') + ['d'] + List.filled(12, 'b'),
    "e": List.filled(12, 'a') + ['e'] + List.filled(12, 'a'),
    "i": List.filled(12, 'j') + ['i'] + List.filled(12, 'j'),
    "M": List.filled(12, 'W') + ['M'] + List.filled(12, 'W'),
    "q": List.filled(12, 'g') + ['q'] + List.filled(12, 'g'),
    "l": List.filled(12, 'i') + ['l'] + List.filled(12, 'i'),
    "K": List.filled(12, 'X') + ['K'] + List.filled(12, 'X'),
    "c": List.filled(12, 'o') + ['c'] + List.filled(12, 'o'),
    "j": List.filled(12, 'i') + ['j'] + List.filled(12, 'i'),
    "g": List.filled(12, 'j') + ['g'] + List.filled(12, 'j'),
    "a": List.filled(12, 'e') + ['a'] + List.filled(12, 'e'),
    "O": List.filled(12, 'Q') + ['O'] + List.filled(12, 'Q'),
    "t": List.filled(12, 'f') + ['t'] + List.filled(12, 'f'),
    "A": List.filled(12, 'V') + ['A'] + List.filled(12, 'V'),
  };
  @override
  void initState() {
    super.initState();
    exerciseletters=[];
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
    print("playedSound: $playedSound");
    // ensures the sound is played only once at the beginning of the exercise
    if (!playedSound) {
      await _initTts();
      await loadLetterSound("Choose the different letter.");
    }
    exerciseletters= generateExercise(Q14To17Map);
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
        missrate =misses / clicks;
        print("missrate:$missrate");
        accuracy =hits / clicks;
        print("accuracy:$accuracy");
        score = hits;
        print("hits:$hits");
        //update database
        //reset performance measures
        clicks=0;
        hits=0;
        misses=0;
        missrate=0;
        accuracy=0;
        score=0;
        widget.navigateToNextScreen(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 220.h, vertical: 70.v),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.gridSize,
                  childAspectRatio: 1.05,
                ),
                itemCount: exerciseletters.length,
                itemBuilder: (context, index) {
                  return _buildGridTile(exerciseletters[index]);
                },
              ),
            ),
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
    );

  }

  Widget _buildGridTile(String letter) {
    return GestureDetector(
      child: Card(
        elevation: 6,
        child: Container(
          child: Center(
            child: Text(
              letter,
              style: TextStyle(fontSize: 18.0,),
            ),
          ),
        ),
      ),
      onTap: (){
        // save the # clicks , misses , hits then reload the screen
        clicks++;
        print("clicks:$clicks");
        print("letter:$letter");
        print("Key:$selectedKey");
        if(letter==selectedKey){
        hits++;print("hits:$hits");
        }else{misses++;print("misses:$misses");}
        widget.onTapFunction(context);
      },
    );
  }

  List<String> generateExercise(Map<String, List<String>> map) {
    // Choose a random key from the map
    List<String> randomKey = map.keys.toList()..shuffle();
     selectedKey = randomKey.first;
    exerciseletters = map[selectedKey]!;
    exerciseletters.shuffle();
    // remove after picked to avoid repetition
    map.remove(selectedKey);

    return exerciseletters;
  }

  Future<void> loadLetterSound(String text) async{
    try {
      await flutterTts.speak(text);
      playedSound = true;
    } catch (e) {
      print("TTS Error: $e");
    }
  }
}
