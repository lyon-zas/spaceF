// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'package:space/screen/Quiz/quiz.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // final user = context.watchSignedInUser();
    // user.map(
    //   (value) {
    //     _navigateToHomeScreen(context);
    //   },
    //   empty: (_) {
    //     _navigateToAuthScreen(context);
    //   },
    //   initializing: (_) {},
    // );
    Timer(Duration(milliseconds: 9250), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => MainPage()));
    });
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 30, 61, 1),
      body: FlareActor(
        'assets/space_ship_launch.flr',
        animation: 'launch',
        fit: BoxFit.fill,
      ),
    );
  }
}
