import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_tts/flutter_tts.dart';

class DyslexiaExerciseWidget extends StatefulWidget {
  final List<String> letters;
  final int gridSize;
  final bool randomizeList;
  //final void Function() onTapFunction;

  DyslexiaExerciseWidget({required this.letters, required this.gridSize, required this.randomizeList});

  @override
  State<DyslexiaExerciseWidget> createState() => _DyslexiaExerciseWidgetState();
}

class _DyslexiaExerciseWidgetState extends State<DyslexiaExerciseWidget> {
  late List<String> exerciseletters;
  late String randomletter;
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    widget.randomizeList ?
    exerciseletters = generateExercise(widget.letters,widget.gridSize):
    exerciseletters = widget.letters..shuffle();
    _initTts();
    loadLetterSound(exerciseletters);
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.2);
  }

  @override
  void dispose() {
    flutterTts.stop(); // Stop TTS when disposing the widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double horizontalPadding = width * 0.22;
    double verticalPadding = height * 0.02;
    double cardSize = min(width, height) * 0.9;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(horizontalPadding, verticalPadding, horizontalPadding, verticalPadding),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.gridSize,
            childAspectRatio: 1.05,
          ),
          itemCount: exerciseletters.length,
          itemBuilder: (context, index) {
            return _buildGridTile(exerciseletters[index],cardSize);
          },
        ),
      ),
    );

  }

  Widget _buildGridTile(String letter,cardSize) {
    return GestureDetector(
      child: Card(
        elevation: 6,
        child: Container(
          width: cardSize,
          height: cardSize,
          child: Center(
            child: Text(
              letter,
              style: TextStyle(fontSize: 18.0,),
            ),
          ),
        ),
      ),
      onTap: (){
        // Save selected letter
        // navigate to next screen
      },
    );
  }

  List<String> generateExercise(List<String>letters ,int gridSize) {
    List<String> exerciseLetters = [];
    Random random = Random();

    for (int i = 0; i < gridSize * gridSize; i++) {
      int randomIndex= random.nextInt(letters.length);
      exerciseLetters.add(letters[randomIndex]);
    }
    exerciseLetters.shuffle();
    return exerciseLetters;
  }

  Future<void> loadLetterSound(List<String> exerciseletters) async{
    Random random = Random();

    int randomletterIndex = random.nextInt(exerciseletters.length);
    randomletter = exerciseletters[randomletterIndex];

    // Speak the random letter
    try {
      await flutterTts.speak("Choose  "+randomletter);

    } catch (e) {
      print("TTS Error: $e");
    }

  }
}