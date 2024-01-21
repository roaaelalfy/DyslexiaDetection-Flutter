import 'package:flutter/material.dart';
import 'package:dyslexiadetectorapp/screens/q29_screen/q29_screen.dart';
import 'package:dyslexiadetectorapp/screens/q9_screen/q9_screen.dart';
import 'package:dyslexiadetectorapp/screens/q10_screen/q10_screen.dart';
import 'package:dyslexiadetectorapp/screens/q18_screen/q18_screen.dart';
import 'package:dyslexiadetectorapp/screens/q19_screen/q19_screen.dart';
import 'package:dyslexiadetectorapp/screens/q22_screen/q22_screen.dart';
import 'package:dyslexiadetectorapp/screens/q23_screen/q23_screen.dart';
import 'package:dyslexiadetectorapp/screens/q24_screen/q24_screen.dart';
import 'package:dyslexiadetectorapp/screens/q26_screen/q26_screen.dart';
import 'package:dyslexiadetectorapp/screens/q25_screen/q25_screen.dart';
import 'package:dyslexiadetectorapp/screens/q27_screen/q27_screen.dart';
import 'package:dyslexiadetectorapp/screens/q28_screen/q28_screen.dart';
import 'package:dyslexiadetectorapp/screens/q30_screen/q30_screen.dart';
import '../screens/Q1-4/q1_screen/q1_screen.dart';
import '../screens/Q1-4/q2_screen/q2_screen.dart';
import '../screens/Q1-4/q3_screen/q3_screen.dart';
import '../screens/Q1-4/q4_screen/q4_screen.dart';
import '../screens/q14To17_screen/q14_screen.dart';
import '../screens/q5_screen/q5_screen.dart';
import '../screens/q6_screen/q6_screen.dart';
import '../screens/q7_screen/q7_screen.dart';
import '../screens/q8_screen/q8_screen.dart';
import '../screens/q30_screen/q30_1_screen.dart';


class AppRoutes {
  static const String q1Screen = '/q1_screen';
  static const String q2Screen = '/q2_screen';
  static const String q3Screen = '/q3_screen';
  static const String q4Screen = '/q4_screen';
  static const String q5Screen = '/q5_screen';
  static const String q6Screen = '/q6_screen';
  static const String q7Screen = '/q7_screen';
  static const String q8Screen = '/q8_screen';
  static const String q9Screen = '/q9_screen';
  static const String q10Screen = '/q10_screen';
  static const String q14Screen = '/q14_screen';
  static const String q18Screen = '/q18_screen';
  static const String q19Screen = '/q19_screen';
  static const String q22Screen = '/q22_screen';
  static const String q23Screen = '/q23_screen';
  static const String q24Screen = '/q24_screen';
  static const String q25Screen = '/q25_screen';
  static const String q26Screen = '/q26_screen';
  static const String q27Screen = '/q27_screen';
  static const String q28Screen = '/q28_screen';
  static const String q29Screen = '/q29_screen';
  static const String q30Screen = '/q30_screen';
  static const String q301Screen = '/q30_1_screen';
  static const String q31Screen = '/q31_screen';
  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    q1Screen: (context) => Q1Screen(),
    q2Screen: (context) => Q2Screen(),
    q3Screen: (context) => Q3Screen(),
    q4Screen: (context) => Q4Screen(),
    q5Screen: (context) => Q5Screen(),
    q6Screen: (context) => Q6Screen(),
    q7Screen: (context) => Q7Screen(),
    q8Screen: (context) => Q8Screen(),
    q9Screen: (context) => Q9Screen(),
    q10Screen: (context) => Q10Screen(),
    q14Screen: (context) => Q14Screen(),
    q18Screen: (context) => Q18Screen(),
    q19Screen: (context) => Q19Screen(),
    q22Screen: (context) => Q22Screen(),
    q23Screen: (context) => Q23Screen(),
    q24Screen: (context) => Q24Screen(),
    q25Screen: (context) => Q25Screen(),
    q26Screen: (context) => Q26Screen(),
    q27Screen: (context) => Q27Screen(),
    q28Screen: (context) => Q28Screen(),
    q29Screen: (context) => Q29Screen(),
    q30Screen: (context) => Q30Screen(),
    q301Screen: (context) => Q301Screen(),
    //appNavigationScreen: (context) => AppNavigationScreen()
  };
}
