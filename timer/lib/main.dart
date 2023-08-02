import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(TimerApp());

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int totalSeconds = 0;
  Timer? timer;
  bool timerRunning = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    if (!timerRunning) {
      timerRunning = true;
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          totalSeconds++;
          if (totalSeconds >= 60) {
            finishTimer();
          }
        });
      });
    }
  }

  void finishTimer() {
    if (timerRunning) {
      timer?.cancel();
      setState(() {
        timerRunning = false;
      });
    }
  }

  void resendTimer() {
    setState(() {
      totalSeconds = 0;
      timerRunning = false;
      startTimer();
    });
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer with Resend Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(totalSeconds),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            if (totalSeconds >= 60) // Show the Resend button after 60 seconds
              ElevatedButton(
                onPressed: resendTimer,
                child: Text('Resend'),
              ),
          ],
        ),
      ),
    );
  }
}
