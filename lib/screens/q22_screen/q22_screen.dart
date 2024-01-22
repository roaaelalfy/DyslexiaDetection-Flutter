import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math';
class Q22Screen extends StatefulWidget {
  const Q22Screen({Key? key}) : super(key: key);

  @override
  _Q22ScreenState createState() => _Q22ScreenState();
}

class _Q22ScreenState extends State<Q22Screen> {
  List<String> words = ["_ith", "_oat", "me_t", "r_in", "_lum","h_use","bro_n","lang_age"];
  List<String> missingLetters = ["wnmx", "daeb", "adbr", "apeq", "qdpa","aoui","wmxn","nuae"];
  String buttonText = "";
  List<String> selectedLetters = [];
  FlutterTts flutterTts = FlutterTts();
  late int randomIndex;
  @override
  void initState() {
    super.initState();
    _updateWordAndLetters();
    _initTts();
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
  void _updateWordAndLetters() {
    Random random = Random();
    int randomIndex = random.nextInt(words.length);
    setState(() {
      buttonText = words[randomIndex];
      selectedLetters = missingLetters[randomIndex].split('');
    });
  }

  List<String> generateRandomLetters() {
    Random random = Random();
    int randomIndex = random.nextInt(missingLetters.length);
    return missingLetters[randomIndex].split('');
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
            CustomOutlinedButton(
              height: 53.v,
              width: 171.h,
              text: buttonText,
              buttonStyle: CustomButtonStyles.outlineLightBlueTL25,
            ),
            SizedBox(height: 25.v),
            Wrap(
              alignment: WrapAlignment.center,
              children: _buildLetterContainers(context, selectedLetters),
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
        words.removeAt(randomIndex);
        missingLetters.removeAt(randomIndex);
        // Update the button text when a container is clicked
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

  List<Widget> _buildLetterContainers(BuildContext context,
      List<String> letters) {
    List<Widget> containers = [];

    for (String letter in letters) {
      containers.add(_buildContainer(context, letter));
    }

    return containers;
  }


  Future<void> loadLetterSound() async{
    // Speak the random letter
    try {
      await flutterTts.speak("Choose the missing letter");
    } catch (e) {
      print("TTS Error: $e");
    }

  }

}

