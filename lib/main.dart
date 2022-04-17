// ignore_for_file: unused_import

import 'package:bmi/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: 'assets/bmi.png',
        // splashIconSize: 600,
        curve: Curves.easeInSine,
        duration: 2000,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 1500),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    );
  }
}
