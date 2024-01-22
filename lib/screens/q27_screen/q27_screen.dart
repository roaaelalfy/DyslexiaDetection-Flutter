import 'dart:core';
import 'dart:math';
import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Q27Screen extends StatefulWidget {
  const Q27Screen({Key? key}) : super(key: key);

  @override
  State<Q27Screen> createState() => _Q27ScreenState();
}

class _Q27ScreenState extends State<Q27Screen> {
  List<String> words = ['bird', 'potatoes', 'bread', 'vegetable', 'education','break'];
  late String selectedWord;
  late List<String> shuffledLetters;

  late List<String> pressedLetters = [];
  late String correctWord= selectedWord;
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _initTts();
    separateAndShuffleLetters();
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 88.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 58.v,
              width: 149.h,
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
                for (String letter in shuffledLetters)
                  _buildContainer(context, letter),
              ],
            ),
            SizedBox(height: 1.v),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        shuffledLetters.remove(text);
        setState(() {
          pressedLetters.add(text);
          if(pressedLetters.length==correctWord.length){
            Navigator.pushNamed(context, AppRoutes.q28Screen);
            }
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
  void separateAndShuffleLetters() {
    selectedWord = words[Random().nextInt(words.length)];
    shuffledLetters = selectedWord.split('')..shuffle();
  }

  Future<void> loadLetterSound() async{
    try {
      await flutterTts.speak("Rearrange the letters to form a word ");

    } catch (e) {
      print("TTS Error: $e");
    }

  }
}
