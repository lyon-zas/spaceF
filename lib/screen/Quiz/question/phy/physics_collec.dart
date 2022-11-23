// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Quiz/question/phy/datas.dart';
import 'package:space/screen/Quiz/question/phy/phy1list.dart';
import 'package:space/screen/Quiz/question/phy/phy2list.dart';
import 'package:space/screen/Quiz/question/phy/phy3list.dart';
import 'package:space/screen/Quiz/question/phy/play_quiz.dart';
import 'package:space/screen/ads/inline.dart';
import 'package:space/screen/ads/video_ads.dart';
import 'package:space/var.dart';

class PhysicsCollection extends StatefulWidget {
  const PhysicsCollection({
    Key? key,
  }) : super(key: key);

  @override
  _PhysicsCollectionState createState() => _PhysicsCollectionState();
}

class _PhysicsCollectionState extends State<PhysicsCollection> {
  // final provider = Provider.of<EmailSignInProvider>(context);

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

    // saveUser();
    dataPhy1.clear();
    dataPhy2.clear();
    dataPhy3.clear();
    retrieve1();
    retrieve2();
    retrieve3();
  }

  // save users username to firebase for leaderboard

  retrieve1() async {
    await FirebaseFirestore.instance
        .collection("Phy101")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataPhy1.add(QuizTile1(
            colour: Colors.blue, number: doc["number"], quizId: doc["quizId"]));
      });
      print("list value:" + dataPhy1.length.toString());
    });
  }

  retrieve2() async {
    await FirebaseFirestore.instance
        .collection("Phy102")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["number"]);

        print(doc["quizId"]);

        dataPhy2.add(QuizTile2(
            colour: Colors.blue.shade400,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
    });
    print("list value:" + dataPhy2.length.toString());
  }

  retrieve3() async {
    await FirebaseFirestore.instance
        .collection("Phy103")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataPhy3.add(QuizTile3(
            colour: Colors.blue, number: doc["number"], quizId: doc["quizId"]));
      });
      print("list value:" + dataPhy3.length.toString());
    });
  }

  saveUser() {
    print("name2" + nameee);
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

    print("list value:" + dataPhy1.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Physics Quizez',
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
          InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Phy1List();
            })),
            child: Ink(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: 60,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "PHY101",
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
          ),
          InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Phy2List();
            })),
            child: Ink(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'PHY102',
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
          ),
          InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Phy3List();
            })),
            child: Ink(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'PHY103',
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

          return QuizPlay(
            quizId,
            'Phy101',
            number,
            usern: provider,
            title: 'Phy101 Quizes',
            storeName: 'Phy101',
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

          return QuizPlay(
            quizId,
            'Phy102',
            number,
            usern: null,
            title: 'Phy102 Quizes',
            storeName: 'Phy102',
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

class QuizTile3 extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  // final int noOfQuestions;

  const QuizTile3({
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
          print('hel4');

          return QuizPlay(
            quizId,
            'Phy103',
            number,
            usern: null,
            title: 'Phy103 Quizes',
            storeName: 'Phy103',
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
