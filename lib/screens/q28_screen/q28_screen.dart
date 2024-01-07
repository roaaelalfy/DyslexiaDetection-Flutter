import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';

class Q28Screen extends StatefulWidget {
  const Q28Screen({Key? key}) : super(key: key);

  @override
  State<Q28Screen> createState() => _Q28ScreenState();
}

class _Q28ScreenState extends State<Q28Screen> {
  List<String> pressed = [];
  int numberofSyllabas=3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap:(){
            Navigator.pushNamed(context, AppRoutes.q29Screen);
          },
          child: Container(
              width: double.maxFinite,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 63.v,
                        width: 211.h,
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(25.h),
                            border: Border.all(
                                color: appTheme.lightBlue10001, width: 1.h)),
                        child: Center(
                          child: Text(
                            pressed.join(),
                            style: CustomTextStyles.headlineSmallInika.copyWith(
                              color: appTheme.black900,
                            ),
                          ),
                        ),),
                    SizedBox(height: 19.v),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        _buildContainer(context, "en"),
                        _buildContainer(context, "my"),
                        _buildContainer(context, "e"),
                      ],
                    ),
                    SizedBox(height: 1.v),
                  ],
              ),
          ),
        ),
    );
  }

  Widget _buildContainer(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pressed.add(text);
          if(pressed.length==numberofSyllabas){
            Navigator.pushNamed(context, AppRoutes.q29Screen);
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

}
