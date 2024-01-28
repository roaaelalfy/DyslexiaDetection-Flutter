import 'dart:async';
import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  int _timerCount = 30; // Initial timer count in seconds
  static double progressPercentage = 1.0;
  static bool timerStarted = false;

  List<String> _words = ['Datyapd', 'Daytpad', 'Dyapadt', 'Datyapd', 'Daytpad', 'Dyapadt', 'Dyadapt'];
  int _currentWordIndex = 0;

  @override
  void initState() {
    super.initState();

    // Set the delay between words
    const int word1Delay = 2000;
    const int word2Delay = 500;
    const int word3Delay = 500;
    const int word4Delay = 500;
    const int word5Delay = 500;
    const int word6Delay = 500;
    const int word7Delay = 2000; // in milliseconds

    // start timer after the sound is played to start the test
    print("timerStarted $timerStarted");
    if (timerStarted == false) {
      _startTimer();
    }
    // Introduce delays between the appearance of words
    _showWordWithDelay(0, word1Delay);
    _showWordWithDelay(1, word2Delay);
    _showWordWithDelay(2, word3Delay);
    _showWordWithDelay(3, word4Delay);
    _showWordWithDelay(4, word5Delay);
    _showWordWithDelay(5, word6Delay);
    _showWordWithDelay(6, word7Delay);
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds:100), (timer) {
      print("Counter: $_timerCount percentage: $progressPercentage");
      if (_timerCount > 0) {
        setState(() {
          _timerCount--;
          progressPercentage = _timerCount / 25.0;
          timerStarted = true;
        });
      } else {
        // Timer is over, navigate to the next screen
        _timer.cancel(); // to restart timer in the new screen
        timerStarted = false;
        Navigator.pushNamed(context, AppRoutes.login);
      }
    });
  }

  void _showWordWithDelay(int wordIndex, int delay) {
    Future.delayed(Duration(milliseconds: delay), () {
      if (mounted) {
        setState(() {
          _currentWordIndex = wordIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
              ),
              Text(
                _currentWordIndex < _words.length ? _words[_currentWordIndex] : '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenDyslexic',
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
