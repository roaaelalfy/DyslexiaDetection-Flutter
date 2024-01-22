import 'dart:math';

import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Q32Screen extends StatefulWidget {
  const Q32Screen({Key? key}) : super(key: key);

  @override
  _Q32ScreenState createState() => _Q32ScreenState();
}

class _Q32ScreenState extends State<Q32Screen> {
  List<String> letters = ["smay" ,"crench","qota","wabas","glis","glaba","nana"];
  late String nonword;
  late int count;
  List<String> pressedLetters = [];
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    nonword = generateExercise(letters);
    _initTts();
    loadSound(nonword);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 58.v,
              width: double.maxFinite,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildContainer(context, "q"),
                    _buildContainer(context, "w"),
                    _buildContainer(context, "e"),
                    _buildContainer(context, "r"),
                    _buildContainer(context, "t"),
                    _buildContainer(context, "y"),
                    _buildContainer(context, "u"),
                    _buildContainer(context, "i"),
                    _buildContainer(context, "o"),
                    _buildContainer(context, "p"),
                  ],
                ),
                SizedBox(height: 6.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 15.h),
                    _buildContainer(context, "a"),
                    _buildContainer(context, "s"),
                    _buildContainer(context, "d"),
                    _buildContainer(context, "f"),
                    _buildContainer(context, "g"),
                    _buildContainer(context, "h"),
                    _buildContainer(context, "j"),
                    _buildContainer(context, "k"),
                    _buildContainer(context, "l"),
                  ],
                ),
                SizedBox(height: 6.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 35.h),
                    _buildContainer(context, "z"),
                    _buildContainer(context, "x"),
                    _buildContainer(context, "c"),
                    _buildContainer(context, "v"),
                    _buildContainer(context, "b"),
                    _buildContainer(context, "n"),
                    _buildContainer(context, "m"),
                    SizedBox(width: 30.h),
                  ],
                ),
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
        setState(() {
          pressedLetters.add(text);
          // listen to 4 non-words then navigate to next screen
          if(pressedLetters.length==nonword.length){
            Navigator.pushNamed(context, AppRoutes.q32Screen);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.v),
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
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

  //Choose random word to generate exercise
  String generateExercise(List<String> sentences) {
    Random random = Random();
    int randomIndex= random.nextInt(sentences.length);
    nonword = sentences[randomIndex];
    return nonword;
  }

  Future<void> loadSound(String word) async {
    try {
      await flutterTts.speak("Write $word");
    } catch (e) {
      print("TTS Error: $e");
    }
  }


}
