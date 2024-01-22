import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Q14Screen extends StatefulWidget {
  Q14Screen({Key? key}): super(key: key,);
  @override
  State<Q14Screen> createState() => _Q14ScreenState();}


class _Q14ScreenState extends State<Q14Screen> {
  Map<String, List<String>> Q14To17Map = {
    "F": List.filled(12, 'E') + ['F'] + List.filled(12, 'E'),
    "p": List.filled(12, 'q') + ['p'] + List.filled(12, 'q'),
    "u": List.filled(12, 'n') + ['u'] + List.filled(12, 'n'),
    "d": List.filled(12, 'b') + ['d'] + List.filled(12, 'b'),
    "e": List.filled(12, 'a') + ['e'] + List.filled(12, 'a'),
    "i": List.filled(12, 'j') + ['i'] + List.filled(12, 'j'),
    "M": List.filled(12, 'W') + ['M'] + List.filled(12, 'W'),
    "q": List.filled(12, 'g') + ['q'] + List.filled(12, 'g'),
    "K": List.filled(12, 'X') + ['K'] + List.filled(12, 'X'),
  };

  late String key;
  List<String> exerciseletters=[];
  FlutterTts flutterTts = FlutterTts();


  @override
  void initState() {
    super.initState();
    _initTts();
    exerciseletters= generateExercise(Q14To17Map);
    loadLetterSound();

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
            crossAxisCount: 5,
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
              style: TextStyle(fontSize: 24.0,),
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

  List<String> generateExercise(Map<String, List<String>> map) {

    // Choose a random key from the map
    List<String> randomKey = map.keys.toList()..shuffle();
    String selectedKey = randomKey.first;
    exerciseletters = map[selectedKey]!;
    exerciseletters.shuffle();
    map.remove(selectedKey);
    return exerciseletters;
  }

  Future<void> loadLetterSound() async{

    try {
      await flutterTts.speak("Choose the different letter ");

    } catch (e) {
      print("TTS Error: $e");
    }


  }
}
