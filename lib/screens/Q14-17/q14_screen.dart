import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Q14Screen extends StatefulWidget {
  Q14Screen({Key? key}): super(key: key,);
  @override
  State<Q14Screen> createState() => _Q14ScreenState();}
class _Q14ScreenState extends State<Q14Screen> {
  Map<String, List<String>> Q14To17Map = {
    "F": ['E','E','E','E','E','E','F','E','E','E','E','E','E','E','E'],
    "p":  ['q','q','q','q','q','q','q','q','q','q','q','p','q','q','q'],
    "u": ['n','n','n','n','n','n','n','u','n','n','n','n','n','n','n'],
    "d":['b','b','b','b','d','b','b','b','b','b','b','b','b','b','b'],
  };

  late String key;
  List<String> exerciseletters=[];

  @override
  void initState() {
    super.initState();
    key = generateExercise(Q14To17Map);
    loadLetterSound(key);
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

  String generateExercise(Map<String, List<String>> map) {

    // Choose a random key from the map
    List<String> randomKey = map.keys.toList()..shuffle();
    String selectedKey = randomKey.first;
    exerciseletters = map[selectedKey]!;

    exerciseletters.shuffle();

    return selectedKey;
  }

  Future<void> loadLetterSound(String Key) async{

    final audioplayer = AudioPlayer();
    await audioplayer.play(AssetSource('sounds/$Key.mp3'));

  }
}
