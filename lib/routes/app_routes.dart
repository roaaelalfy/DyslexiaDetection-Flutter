import 'package:dyslexiadetectorapp/Authentication/countdown.dart';
import 'package:dyslexiadetectorapp/Authentication/login.dart';
import 'package:dyslexiadetectorapp/Authentication/parent_homepage.dart';
import 'package:dyslexiadetectorapp/Authentication/register.dart';
import 'package:dyslexiadetectorapp/Authentication/role.dart';
import 'package:dyslexiadetectorapp/Authentication/splash_screen.dart';
import 'package:dyslexiadetectorapp/Authentication/start_exam.dart';
import 'package:flutter/material.dart';
import 'package:dyslexiadetectorapp/screens/q29_screen/q29_screen.dart';
import 'package:dyslexiadetectorapp/screens/Q5-9/q9_screen.dart';
import 'package:dyslexiadetectorapp/screens/q22_screen/q22_screen.dart';
import 'package:dyslexiadetectorapp/screens/q23_screen/q23_screen.dart';
import 'package:dyslexiadetectorapp/screens/q24_screen/q24_screen.dart';
import 'package:dyslexiadetectorapp/screens/q26_screen/q26_screen.dart';
import 'package:dyslexiadetectorapp/screens/q25_screen/q25_screen.dart';
import 'package:dyslexiadetectorapp/screens/q27_screen/q27_screen.dart';
import 'package:dyslexiadetectorapp/screens/q28_screen/q28_screen.dart';
import 'package:dyslexiadetectorapp/screens/q30_screen/q30_screen.dart';
import '../screens/Q1-4/q2_screen.dart';
import '../screens/Q1-4/q1_screen.dart';
import '../screens/Q10-13/q11_screen.dart';
import '../screens/Q10-13/q12_screen.dart';
import '../screens/Q10-13/q13_screen.dart';
import '../screens/Q14-17/q14_screen.dart';
import '../screens/Q14-17/q15_screen.dart';
import '../screens/Q14-17/q16_screen.dart';
import '../screens/Q14-17/q17_screen.dart';
import '../screens/Q1-4/q3_screen.dart';
import '../screens/Q1-4/q4_screen.dart';
import '../screens/Q10-13/q10_screen.dart';
import '../screens/Q5-9/q5_screen.dart';
import '../screens/Q5-9/q6_screen.dart';
import '../screens/Q5-9/q7_screen.dart';
import '../screens/Q5-9/q8_screen.dart';
import '../screens/Q18-21/q18_screen.dart';
import '../screens/Q18-21/q19_screen.dart';
import '../screens/Q18-21/q20_screen.dart';
import '../screens/Q18-21/q21_screen.dart';
import '../screens/q30_screen/q30_1_screen.dart';
import '../screens/q31_screen/q31_screen.dart';
import '../screens/q32_screen/q32_screen.dart';


class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String login = '/login';
  static const String register = '/register';
  static const String role = '/role';
  static const String startExam = '/start_exam';
  static const String countdown= '/countdown';
  static const String parentHomePage = '/parent_homepage';
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
  static const String q11Screen = '/q11_screen';
  static const String q12Screen = '/q12_screen';
  static const String q13Screen = '/q13_screen';
  static const String q14Screen = '/q14_screen';
  static const String q15Screen = '/q15_screen';
  static const String q16Screen = '/q16_screen';
  static const String q17Screen = '/q17_screen';
  static const String q18Screen = '/q18_screen';
  static const String q19Screen = '/q19_screen';
  static const String q20Screen = '/q20_screen';
  static const String q21Screen = '/q21_screen';
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
  static const String q32Screen = '/q32_screen';
  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen :(context) => SplashScreen(),
    register:(context) => RegisterPage(),
    login: (context) => LoginPage(),
    role: (context) => RolePage(),
    startExam : (context) => StartExamPage(),
    countdown : (context) => CountdownScreen(),
    parentHomePage: (context) => ParentHomePage(),
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
    q11Screen: (context) => Q11Screen(),
    q12Screen: (context) => Q12Screen(),
    q13Screen: (context) => Q13Screen(),
    q14Screen: (context) => Q14Screen(),
    q15Screen: (context) => Q15Screen(),
    q16Screen: (context) => Q16Screen(),
    q17Screen: (context) => Q17Screen(),
    q18Screen: (context) => Q18Screen(),
    q19Screen: (context) => Q19Screen(),
    q20Screen: (context) => Q20Screen(),
    q21Screen: (context) => Q21Screen(),
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
    q31Screen: (context) => Q31Screen(),
    q32Screen: (context) => Q32Screen(),
    //appNavigationScreen: (context) => AppNavigationScreen()
  };
}
