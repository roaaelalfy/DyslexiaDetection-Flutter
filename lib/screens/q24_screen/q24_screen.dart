import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';

class Q24Screen extends StatefulWidget {
  const Q24Screen({Key? key}) : super(key: key);

  @override
  _Q24ScreenState createState() => _Q24ScreenState();
}

class _Q24ScreenState extends State<Q24Screen> {
  List<String> words = ["The", "affect", "of", "the", "wind", "was", "to", "cause", "the", "boat’s", "sail", "to", "billow"];
  List<bool> clickedStatus = List.generate(13, (index) => false);

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
                words.length,
                (index) => _buildWord(context, words[index], index),
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
}
