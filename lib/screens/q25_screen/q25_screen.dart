import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Q25Screen extends StatefulWidget {
  const Q25Screen({Key? key}) : super(key: key);

  @override
  _Q25ScreenState createState() => _Q25ScreenState();
}

class _Q25ScreenState extends State<Q25Screen> {
  Map<String, List<String>> Q25Map = {
    "of": ['Smoking','is','prohibited','of','the','entire','craft.'],
    "them":  ['This','homework','is','so','easy','.  I','can','do','them' ,'in','five','minutes.'],
    "was": ['I','swim','in','the','sea','whenever','the','weather','was','fine.'],
    "were":['When','we','went','shopping','it','were','very','busy.'],
  };
  late List<bool> clickedStatus;
  late List<String> exerciseWords;
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    exerciseWords = generateExercise(Q25Map);
    _initTts();
    loadSound();
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
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 22.h),
        child: buildSentence(context),
      ),
    );
  }

  Widget buildSentence(BuildContext context) {
    return Container(
      width: 349.h,
      padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 30.v),
      decoration: AppDecoration.outlineLightblue100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Container(
            width: 326.h,
            margin: EdgeInsets.only(right: 8.h),
            child: Wrap(
              spacing: 8.h,
              children: List.generate(
                exerciseWords.length,
                    (index) => _buildWord(context, exerciseWords[index], index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWord(BuildContext context, String word, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          clickedStatus[index] = !clickedStatus[index];
          // store the selected word then navigate
          Navigator.pushNamed(context, AppRoutes.q26Screen);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
        child: Text(
          word,
          style: CustomTextStyles.headlineSmallInika.copyWith(
            color: clickedStatus[index] ? appTheme.lightBlue100 : appTheme.black900,
          ),
        ),
      ),
    );
  }

  //Choose random list to generate exercise
  List<String> generateExercise(Map<String, List<String>> map) {
    // Choose a random key from the map
    List<String> randomKey = map.keys.toList()..shuffle();
    String selectedKey = randomKey.first;
    exerciseWords = map[selectedKey]!;

    clickedStatus = List.generate(exerciseWords.length, (index) => false);
    return exerciseWords;
  }
  Future<void> loadSound() async {
    try {
      await flutterTts.speak("Find the wrong word.");
    } catch (e) {
      print("TTS Error: $e");
    }
  }

}
