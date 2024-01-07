import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';

class Q23Screen extends StatefulWidget {
  const Q23Screen({Key? key}) : super(key: key);

  @override
  _Q23ScreenState createState() => _Q23ScreenState();
}

class _Q23ScreenState extends State<Q23Screen> {
  List<String> letters = ["A", "w", "e", "a", "s", "o", "m", "e"];

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
        children: letters.map((letter) => Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: InkWell(
              onTap: () {
                setState(() {
                  letters.remove(letter);
                  Navigator.pushNamed(context, AppRoutes.q24Screen);
                });
              },
              child: Text(
                letter,
                style: CustomTextStyles.headlineSmallInika,
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }
}
