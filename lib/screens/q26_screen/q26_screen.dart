import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';

class Q26Screen extends StatefulWidget {
  const Q26Screen({Key? key}) : super(key: key);

  @override
  _Q26ScreenState createState() => _Q26ScreenState();
}

class _Q26ScreenState extends State<Q26Screen> {
  List<String> testWord = ["We" , "b" , "nesday"];

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
                Text(testWord[0] , style: TextStyle( fontSize: 30),),
                SizedBox(width: 2.h,),
                Text(testWord[1] , style: TextStyle( color: Colors.lightBlueAccent ,fontSize: 30),),
                SizedBox(width: 2.h,),
                Text(testWord[2] , style: TextStyle(fontSize: 30),)
              ],
            ),
            SizedBox(height: 25.v),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                _buildContainer(context, "q"),
                _buildContainer(context, "b"),
                _buildContainer(context, "d"),
                _buildContainer(context, "p"),
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
          testWord[1]= text;
        });
        Navigator.pushNamed(context, AppRoutes.q27Screen);
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
}
