import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class Q30Screen extends StatefulWidget {
  const Q30Screen({Key? key}) : super(key: key);

  @override
  _Q30ScreenState createState() => _Q30ScreenState();
}

class _Q30ScreenState extends State<Q30Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, AppRoutes.q301Screen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.maxFinite,
          child: CustomOutlinedButton(
            width: 236.h,
            text: "p  g  d  j",
            buttonTextStyle: theme.textTheme.headlineSmall!,
          ),
        ),
      ),
    );
  }
}
