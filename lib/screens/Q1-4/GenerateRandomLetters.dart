import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DyslexiaExerciseWidget extends StatefulWidget {
  final List<String> letters;
  final int gridSize;

  DyslexiaExerciseWidget({required this.letters, required this.gridSize});

  @override
  State<DyslexiaExerciseWidget> createState() => _DyslexiaExerciseWidgetState();
}

class _DyslexiaExerciseWidgetState extends State<DyslexiaExerciseWidget> {
  late List<String> exerciseletters;
  late String randomletter;

  @override
  void initState() {
    super.initState();
    exerciseletters = generateExercise(widget.letters,widget.gridSize);
    loadLetterSound(exerciseletters);
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double horizontalPadding = width * 0.22;
    double verticalPadding = height * 0.30;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(horizontalPadding, verticalPadding, horizontalPadding, verticalPadding),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.gridSize,
          ),
          itemCount: exerciseletters.length,
          itemBuilder: (context, index) {
            return _buildGridTile(exerciseletters[index]);
          },
        ),
      ),
    );

  }

  Widget _buildGridTile(String letter) {
    return GestureDetector(
      child: Card(
        elevation: 6,
        child: Center(
          child: Text(
            letter,
            style: TextStyle(fontSize: 24.0,),
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

    final audioplayer = AudioPlayer();
    await audioplayer.play(AssetSource('sounds/$randomletter.mp3'));

  }
}
