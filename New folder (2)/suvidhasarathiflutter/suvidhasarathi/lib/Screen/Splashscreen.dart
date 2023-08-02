import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suvidha_sarathi/Screen/Login.dart';
import 'package:suvidha_sarathi/Unitls/geticon.dart';

void main() {
  runApp(const RunMyApp());
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(
            height: double.infinity,
            fit: BoxFit.fill,
            width: double.infinity,
            image: AssetImage(getIcons.splashscreen),
          ),
        ),
      ),
    );
  }
}
