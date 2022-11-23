// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Quiz/question/math/datas.dart';
import 'package:space/screen/Quiz/question/math/math1list.dart';
import 'package:space/screen/Quiz/question/math/math2list.dart';
import 'package:space/screen/Quiz/question/math/math3list.dart';
import 'package:space/screen/Quiz/question/math/math4list.dart';
import 'package:space/screen/Quiz/question/math/play_quiz_math.dart';
import 'package:space/screen/Quiz/question/phy/play_quiz.dart';
import 'package:space/screen/ads/inline.dart';

class MathCollection extends StatefulWidget {
  const MathCollection({
    Key? key,
  }) : super(key: key);

  @override
  _MathCollectionState createState() => _MathCollectionState();
}

class _MathCollectionState extends State<MathCollection> {
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
    dataMath1.clear();
    dataMath2.clear();
    dataMath3.clear();
    dataMath4.clear();
    retrieve1();
    retrieve2();
    retrieve3();
    retrieve4();
  }

  // save users username to firebase for leaderboard

  retrieve1() async {
    await FirebaseFirestore.instance
        .collection("MTH101")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataMath1.add(QuizTile1(
            colour: Colors.purple,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataMath1.length.toString());
    });
  }

  retrieve2() async {
    await FirebaseFirestore.instance
        .collection("MTH102")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["number"]);

        print(doc["quizId"]);

        dataMath2.add(QuizTile2(
            colour: Colors.purple.shade400,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
    });
  }

  retrieve3() async {
    await FirebaseFirestore.instance
        .collection("MTH103")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataMath3.add(QuizTile3(
            colour: Colors.purple,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataMath3.length.toString());
    });
  }

  retrieve4() async {
    await FirebaseFirestore.instance
        .collection("MTH104")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataMath4.add(QuizTile4(
            colour: Colors.purple,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataMath4.length.toString());
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
        backgroundColor: Colors.purple,
        title: Text(
          'Math Quizzes',
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
              return Math1List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "MTH101",
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
              return Math2List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'MTH102',
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
              return Math3List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'MTH103',
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
              return Math4List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'MTH104',
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
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) => QuizPlay(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayMath(
            quizId,
            'MTH101',
            number,
            usern: null,
            title: 'Matth101 Quizes',
            storeName: 'Mth101',
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

          return QuizPlayMath(
            quizId,
            'MTH102',
            number,
            usern: null,
            title: 'Math102 Quizes',
            storeName: 'Mth102',
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
    final provider = Provider.of<EmailSignInProvider>(context);
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) => QuizPlay(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayMath(
            quizId,
            'MTH103',
            number,
            usern: provider,
            title: 'Math103 Quizes',
            storeName: 'Mth103',
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

class QuizTile4 extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  // final int noOfQuestions;

  const QuizTile4({
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

          return QuizPlayMath(
            quizId,
            'MTH104',
            number,
            usern: null,
            title: 'Math104 Quizes',
            storeName: 'Mth104',
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
