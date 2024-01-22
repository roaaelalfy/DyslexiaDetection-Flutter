import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Q24Screen extends StatefulWidget {
  const Q24Screen({Key? key}) : super(key: key);

  @override
  _Q24ScreenState createState() => _Q24ScreenState();
}

class _Q24ScreenState extends State<Q24Screen> {
  Map<String, List<String>> Q24Map = {
    "affect": ['The','affect','of','the','wind','was','to','cause','the','boat’s','sail','to','billow.'],
    "meet":  ['The','restaurant','offers','a','delicious','meet','dish','for','dinner.'],
    "then": ['There','are','less','girls','in','our','class','then','boys.'],
    "net":['You','must','get','your','neat','for','fishing.'],
  };
  late List<bool> clickedStatus;
  late List<String> exerciseWords;
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    exerciseWords = generateExercise(Q24Map);
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
          Navigator.pushNamed(context, AppRoutes.q25Screen);
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
