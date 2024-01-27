import 'dart:async';
import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  late Timer _timer;
  int _countdown = 10; // Set the initial countdown duration in seconds

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        _timer.cancel(); // Stop the timer when the countdown is finished
        // Perform any action you want when the countdown is finished
        print('Countdown finished!');
        Navigator.pushNamed(context, AppRoutes.q1Screen);
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
      body: Center(
        child: Text(
          '$_countdown',
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: [Colors.blue, Colors.white, Colors.blue],
              ).createShader(Rect.fromCircle(center: Offset(0, 0), radius: 150)),),
        ),
      ),
    );
  }
}
