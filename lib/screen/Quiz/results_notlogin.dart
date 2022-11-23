import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:space/screen/Auth/auth.dart';
import 'package:startapp/startapp.dart';

class Resul extends StatefulWidget {
  final int correct, incorrect, total, number;
  const Resul(
      {Key? key,
      required this.correct,
      required this.incorrect,
      required this.total,
      required this.number})
      : super(key: key);

  @override
  _ResulState createState() => _ResulState();
}

class _ResulState extends State<Resul> {
  void initState() {
    print("kkkkkkkkkk");
    StartApp.showRewardedAd(onVideoCompleted: () {
      // video completed callback
    }, onReceiveAd: () {
      // ad received callback
    }, onFailedToReceiveAd: (String error) {
      // failed to received ad callback
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${widget.correct} / ${widget.total}",
              style: const TextStyle(fontSize: 25)),
          const SizedBox(
            height: 8,
          ),
          Text(
            "You have answered ${widget.correct} anwers correctly and ${widget.incorrect} anwers incorrectly",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue),
                height: 50,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("Go To Game Center",
                        style: TextStyle(fontSize: 17, color: Colors.white)),
                  ),
                ),
              )),
          const SizedBox(height: 15),
          const Center(
            child: Text(
              "Results not stored you arent logged in",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const AuthScreen())),
            child: const Center(
              child: Text(
                "Login/SignUp",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.green,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    )));
  }
}
