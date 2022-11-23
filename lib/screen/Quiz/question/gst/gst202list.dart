import 'dart:ui';

import "package:flutter/material.dart";

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Quiz/question/gst/datas.dart';
import 'package:space/screen/Quiz/question/gst/play_quiz_gst.dart';
import 'package:space/screen/Quiz/question/phy/datas.dart';
import 'package:space/screen/Quiz/question/phy/play_quiz.dart';

class Gst202List extends StatefulWidget {
  const Gst202List({Key? key}) : super(key: key);

  @override
  _Gst202ListState createState() => _Gst202ListState();
}

class _Gst202ListState extends State<Gst202List> {
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
          children: dataGst202,
        ),
      ),
    );
  }

  Widget quizList() {
    return Container(
        child: ListView(
      children: dataGst202,
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
    required this.quizId, this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final  provider = Provider.of<EmailSignInProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('helloooo');

          return QuizPlayGst(quizId, 'GST202', number, usern: provider.userName, title: 'GST202 Quizes',storeName: 'Gst202',);
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
