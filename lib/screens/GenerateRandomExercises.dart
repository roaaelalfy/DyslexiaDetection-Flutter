import 'dart:async';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DyslexiaExerciseWidget extends StatefulWidget {
  final List<String> letters;
  final int gridSize;
  final bool randomizeList;
  final void Function(BuildContext context) onTapFunction;
  final void Function(BuildContext context) navigateToNextScreen;

  DyslexiaExerciseWidget({
    required this.gridSize,
    required this.onTapFunction,
    required this.navigateToNextScreen,
    required this.letters, required this.randomizeList});

  @override
  State<DyslexiaExerciseWidget> createState() => _DyslexiaExerciseWidgetState();
}

class _DyslexiaExerciseWidgetState extends State<DyslexiaExerciseWidget> {
  late List<String> exerciseletters;
  Random random = Random();
  static String? randomLetter;

  late FlutterTts flutterTts;
  static bool playedSound = false;

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
    randomLetter ??= String.fromCharCode(random.nextInt(widget.letters.length));
    print("playedSound: $playedSound");
    // ensures the sound is played only once at the beginning of the exercise
    if (!playedSound) {
      await _initTts();
      await loadLetterSound("Choose $randomLetter!");
    }
    widget.randomizeList ?
    exerciseletters = generateExercise(widget.letters,widget.gridSize):
    exerciseletters = widget.letters..shuffle();
  }

  @override
  void dispose() {
    flutterTts.stop(); // Stop TTS when disposing the widget
    super.dispose();
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
        randomLetter = null;
        playedSound = false;
        timerStarted = false;
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
        widget.onTapFunction(context);
      },
    );
  }

  List<String> generateExercise(List<String>letters ,int gridSize) {
    List<String> myExerciseList = [];
    myExerciseList.add(randomLetter!);

    for (int i = 0; i < gridSize * gridSize-1; i++) {
      int randomIndex= random.nextInt(letters.length);
      myExerciseList.add(letters[randomIndex]);
    }
    myExerciseList.shuffle();
    return myExerciseList;
  }

  Future<void> loadLetterSound(String text) async {
    try {
      await flutterTts.speak(text);
      playedSound = true;
    } catch (e) {
      print("TTS Error: $e");
    }
  }

}