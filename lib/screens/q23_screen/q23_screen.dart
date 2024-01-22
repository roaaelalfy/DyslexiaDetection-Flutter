import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';
import'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
class Q23Screen extends StatefulWidget {
  const Q23Screen({Key? key}) : super(key: key);

  @override
  _Q23ScreenState createState() => _Q23ScreenState();
}

class _Q23ScreenState extends State<Q23Screen> {
  List<String> letters = ["Soame","Aweasome","goaod","Hapqpy","boax","Handsoame","Beaeutiful"];
  late List<String>characters;
  FlutterTts flutterTts = FlutterTts();
  @override
  void initState() {
    super.initState();
    _generateRandomWord();
    _initTts();
    loadLetterSound();
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
   void _generateRandomWord(){
    int randomIndex = _generateRandomIndex();
    // Get the word at the random index
  String randomWord = letters[randomIndex];
  characters = randomWord.split('');
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 38.h),
          child: buildWord(context),
        ),
      ),
    );
  }

  Widget buildWord(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 11.v),
      decoration: AppDecoration.outlineLightblue10001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          characters.length,
              (index) => Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: InkWell(
              onTap: () {
                setState(() {
                  characters.removeAt(index);
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

  // Function to generate a random index
  int _generateRandomIndex() {
    return Random().nextInt(letters.length);
  }
  Future<void> loadLetterSound() async{
    // Speak the random letter
    try {
      await flutterTts.speak("Remove the extra letter");
    } catch (e) {
      print("TTS Error: $e");
    }

  }

}
