import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class Q22Screen extends StatefulWidget {
  const Q22Screen({Key? key}) : super(key: key);

  @override
  _Q22ScreenState createState() => _Q22ScreenState();
}

class _Q22ScreenState extends State<Q22Screen> {
  String buttonText = " _ith";

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
              children: [
                _buildContainer(context, "w"),
                _buildContainer(context, "a"),
                _buildContainer(context, "o"),
                _buildContainer(context, "g"),
                _buildContainer(context, "u"),
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
        // Update the button text when a container is clicked
        setState(() {
          buttonText = "$text ith";
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
}
