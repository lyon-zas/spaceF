// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Quiz/question/chm/chm1list.dart';
import 'package:space/screen/Quiz/question/chm/chm2list.dart';
import 'package:space/screen/Quiz/question/chm/datas.dart';
import 'package:space/screen/Quiz/question/chm/play_quiz_chm.dart';
import 'package:space/screen/Quiz/question/phy/play_quiz.dart';
import 'package:space/screen/ads/inline.dart';
import 'package:space/var.dart';

class ChemistryCollection extends StatefulWidget {
  const ChemistryCollection({
    Key? key,
  }) : super(key: key);

  @override
  _ChemistryCollectionState createState() => _ChemistryCollectionState();
}

class _ChemistryCollectionState extends State<ChemistryCollection> {
  Providerr() {
    final provider;
    return provider = Provider.of<EmailSignInProvider>(context);
  }

  @override
  void initState() {
    super.initState();

    Firebase.initializeApp().whenComplete(() {
      print("completed");

      // databaseService.getQuizData().then((val) {
      //   quizStream = val;
    });

    dataChm1.clear();
    dataChm2.clear();
    retrieve1();

    retrieve2();

    // saveUser();
  }

  // save users username to firebase for leaderboard

  retrieve1() async {
    await FirebaseFirestore.instance
        .collection("CHM101")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataChm1.add(QuizTile1(
            colour: Colors.orange,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataChm1.length.toString());
    });
  }

  retrieve2() async {
    await FirebaseFirestore.instance
        .collection("CHM102")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["number"]);

        print(doc["quizId"]);

        dataChm2.add(QuizTile2(
            colour: Colors.orange,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
    });
  }

  saveUser() {
    print("name" + nameee);
   
      FirebaseFirestore.instance
          .collection("users")
          .doc(nameee)
          .set(
            ({
              'username': nameee, // John Doe
            }),
            SetOptions(merge: true),
          )
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.orange,
        title: Text(
          'Chemistry Quizez',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView(
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Chm1List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "CHM101",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Chm2List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'CHM102',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      //  bottomNavigationBar: InlineAds(),
    );
  }

  Widget notLogin() {
    return Text('Login to save user score');
  }
}

class QuizTile1 extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  // final int noOfQuestions;

  const QuizTile1({
    Key? key,
    required this.colour,
    required this.number,
    required this.quizId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) => QuizPlay(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayChm(
            quizId,
            'CHM101',
            number,
            usern: provider,
            title: 'Chm101 Quizes',
            storeName: 'Chm101',
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
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

class QuizTile2 extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  // final int noOfQuestions;

  const QuizTile2({
    Key? key,
    required this.colour,
    required this.number,
    required this.quizId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) => QuizPlay(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayChm(
            quizId,
            'CHM102',
            number,
            usern: null,
            title: 'Chm102 Quizes',
            storeName: 'Chm102',
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
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
