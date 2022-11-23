import 'dart:ui';

import "package:flutter/material.dart";

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Quiz/question/math/datas.dart';
import 'package:space/screen/Quiz/question/math/play_quiz_math.dart';
import 'package:space/screen/ads/inline.dart';

class Math4List extends StatefulWidget {
  const Math4List({Key? key}) : super(key: key);

  @override
  _Math4ListState createState() => _Math4ListState();
}

class _Math4ListState extends State<Math4List> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      // databaseService.getQuizData().then((val) {
      //   quizStream = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        //brightness: Brightness.li,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: dataMath4,
        ),
      ),
       bottomNavigationBar: InlineAds(),
    );
  }

  Widget quizList() {
    return Container(
        child: ListView(
      children: dataMath4,
    ));
  }
}

class QuizTile extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  final provider;
  // final int noOfQuestions;

  const QuizTile({
    Key? key,
    required this.colour,
    required this.number,
    required this.quizId,
    this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('helloooo');

          return QuizPlayMath(
            quizId,
            'MTH104',
            number,
            usern: provider.userName,
            title: 'Math104 Quizes', storeName: 'Mth104',
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Container(
                color: colour,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        number.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
