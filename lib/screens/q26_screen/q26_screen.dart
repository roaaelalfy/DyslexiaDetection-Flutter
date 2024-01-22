import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
class Q26Screen extends StatefulWidget {
  const Q26Screen({Key? key}) : super(key: key);

  @override
  _Q26ScreenState createState() => _Q26ScreenState();
}

class _Q26ScreenState extends State<Q26Screen> {
  List<Map<String, dynamic>> listOfMaps = [
    {'b': "webnesday"},
    {'e': "fridey"},
    {'w': "nuwber"},
    {'i': "iacket"},
    {'n': "npset"},
    {'e': "Triel"},
    {'E':"Elash"},
    {'e':"goel"}
  ];
  List<String> possibleWrongLetters = ["dbay", "daqp", "xmnu", "jegp","uaeo","uaio","FTLI","aouh"];
  List<String> testWord = [];
  int randomIndex=0;
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _generateRandomIndex();
    _generateRandomTestWord();
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
  String getKey() {
    return listOfMaps[randomIndex].keys.first;
  }
  void _generateRandomIndex() {
    Random random = Random();
    randomIndex = random.nextInt(listOfMaps.length);
  }

  void _generateRandomTestWord() {
    testWord = listOfMaps[randomIndex].values.first.split('');
  }
  List<String> generateRandomLetters() {
    return possibleWrongLetters[randomIndex].split('');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 72.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < testWord.length; i++)
                  Text(
                    testWord[i],
                    style: TextStyle(
                      color: (testWord[i] == getKey()) ? Colors.red : appTheme.black900,
                      fontSize: 30,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 25.v),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < generateRandomLetters().length; i++)
                  _buildContainer(context, generateRandomLetters()[i], i),
              ],
            ),
            SizedBox(height: 1.v),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context, String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Replace the letter at the specific index with the tapped letter
          testWord[testWord.indexOf(getKey())] = text;
          listOfMaps.removeAt(randomIndex);
          possibleWrongLetters.removeAt(randomIndex);


        });
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
  Future<void> loadLetterSound() async{
    // Speak the random letter
    try {
      await flutterTts.speak("Correct the Wrong letter");
    } catch (e) {
      print("TTS Error: $e");
    }

  }
}


