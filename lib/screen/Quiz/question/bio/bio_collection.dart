// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Quiz/question/bio/bio1list.dart';
import 'package:space/screen/Quiz/question/bio/bio2list.dart';
import 'package:space/screen/Quiz/question/bio/datas.dart';
import 'package:space/screen/Quiz/question/bio/play_quiz_bio.dart';
import 'package:space/screen/Quiz/question/phy/play_quiz.dart';
import 'package:space/screen/ads/inline.dart';

class BiologyCollection extends StatefulWidget {
  const BiologyCollection({
    Key? key,
  }) : super(key: key);

  @override
  _BiologyCollectionState createState() => _BiologyCollectionState();
}

class _BiologyCollectionState extends State<BiologyCollection> {
  Providerr() {
    final provider;
    return provider = Provider.of<EmailSignInProvider>(context).userName;
  }

  late String nameee;
  @override
  void initState() {
    super.initState();

    Firebase.initializeApp().whenComplete(() {
      print("completed");

      // databaseService.getQuizData().then((val) {
      //   quizStream = val;
    });

    // saveUser();
    dataBio1.clear();
    dataBio2.clear();
    retrieve1();

    retrieve2();
  }

  // save users username to firebase for leaderboard

  retrieve1() async {
    await FirebaseFirestore.instance
        .collection("BIO101")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataBio1.add(QuizTile1(
            colour: Colors.blue.shade900,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataBio1.length.toString());
    });
  }

  retrieve2() async {
    await FirebaseFirestore.instance
        .collection("BIO102")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["number"]);

        print(doc["quizId"]);

        dataBio2.add(QuizTile2(
            colour: Colors.blue.shade900,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
    });
  }

  saveUser() {
    nameee = Providerr();

    FirebaseFirestore.instance
        .collection("users")
        .doc("$nameee")
        .set(
          ({
            'username': nameee, // John Doe
          }),
          SetOptions(merge: true),
        )
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.blue[900],
        title: Text(
          'Biology Quizzes',
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
              return Bio1List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "BIO101",
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
              return Bio2List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'BIO102',
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
      // bottomNavigationBar: InlineAds(),
    );
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

          return QuizPlayBio(
            quizId,
            'BIO101',
            number,
            usern: provider,
            title: 'Bio101 Quizes',
            storeName: 'Bio101',
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

          return QuizPlayBio(
            quizId,
            'BIO102',
            number,
            usern: null,
            title: 'Bio102 Quizes',
            storeName: 'Bio102',
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
