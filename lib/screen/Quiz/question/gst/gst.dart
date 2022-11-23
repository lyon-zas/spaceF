// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Quiz/question/gst/datas.dart';
import 'package:space/screen/Quiz/question/gst/gst110list.dart';
import 'package:space/screen/Quiz/question/gst/gst11list.dart';
import 'package:space/screen/Quiz/question/gst/gst12list.dart';
import 'package:space/screen/Quiz/question/gst/gst13list.dart';
import 'package:space/screen/Quiz/question/gst/gst15.dart';
import 'package:space/screen/Quiz/question/gst/gst16.dart';
import 'package:space/screen/Quiz/question/gst/gst18list.dart';
import 'package:space/screen/Quiz/question/gst/gst202list.dart';
import 'package:space/screen/Quiz/question/gst/gst203list.dart';
import 'package:space/screen/Quiz/question/gst/gst204list.dart';
import 'package:space/screen/Quiz/question/gst/gst205list.dart';
import 'package:space/screen/Quiz/question/gst/play_quiz_gst.dart';
import 'package:space/screen/Quiz/question/phy/play_quiz.dart';
import 'package:space/screen/ads/inline.dart';

class GstCollection extends StatefulWidget {
  const GstCollection({
    Key? key,
  }) : super(key: key);

  @override
  _GstCollectionState createState() => _GstCollectionState();
}

class _GstCollectionState extends State<GstCollection> {
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
    dataGst101.clear();
    dataGst102.clear();
    dataGst103.clear();
    dataGst105.clear();
    dataGst106.clear();
    dataGst108.clear();
    dataGst110.clear();
    dataGst202.clear();
    dataGst203.clear();
    dataGst204.clear();
    dataGst205.clear();
    retrieve1();
    retrieve2();
    retrieve3();
    retrieve4();
    retrieve5();
    retrieve6();
    retrieve7();
    retrieve8();
    retrieve9();
    retrieve10();
    retrieve11();
  }

  // save users username to firebase for leaderboard

  retrieve1() async {
    await FirebaseFirestore.instance
        .collection("GST101")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataGst101.add(QuizTile1(
            colour: Colors.green,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataGst101.length.toString());
    });
  }

  retrieve2() async {
    await FirebaseFirestore.instance
        .collection("GST102")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["number"]);

        print(doc["quizId"]);

        dataGst102.add(QuizTile2(
            colour: Colors.green.shade400,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
    });
    print("list value:" + dataGst102.length.toString());
  }

  retrieve3() async {
    await FirebaseFirestore.instance
        .collection("GST103")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataGst103.add(QuizTile3(
            colour: Colors.green,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataGst103.length.toString());
    });
  }

  retrieve4() async {
    await FirebaseFirestore.instance
        .collection("GST105")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataGst105.add(QuizTile4(
            colour: Colors.green,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataGst105.length.toString());
    });
  }

  retrieve5() async {
    await FirebaseFirestore.instance
        .collection("GST106")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataGst106.add(QuizTile5(
            colour: Colors.green,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataGst106.length.toString());
    });
  }

  retrieve6() async {
    await FirebaseFirestore.instance
        .collection("GST108")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('asspp');
        print(doc["number"]);
        dataGst108.add(QuizTile6(
            colour: Colors.green,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataGst108.length.toString());
    });
  }

  retrieve7() async {
    await FirebaseFirestore.instance
        .collection("GST110")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataGst110.add(QuizTile7(
            colour: Colors.green,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataGst110.length.toString());
    });
  }

  retrieve8() async {
    await FirebaseFirestore.instance
        .collection("GST202")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataGst202.add(QuizTile8(
            colour: Colors.green,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataGst202.length.toString());
    });
  }

  retrieve9() async {
    await FirebaseFirestore.instance
        .collection("GST203")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataGst203.add(QuizTile9(
            colour: Colors.green,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataGst203.length.toString());
    });
  }

  retrieve10() async {
    await FirebaseFirestore.instance
        .collection("GST204")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataGst204.add(QuizTile10(
            colour: Colors.green,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataGst204.length.toString());
    });
  }

  retrieve11() async {
    await FirebaseFirestore.instance
        .collection("GST205")
        .orderBy("number", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('assss');
        print(doc["number"]);
        dataGst205.add(QuizTile11(
            colour: Colors.green,
            number: doc["number"],
            quizId: doc["quizId"]));
      });
      print("list value:" + dataGst205.length.toString());
    });
  }

  saveUser() {
    nameee = Providerr().username;

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
        backgroundColor: Colors.green,
        title: Text(
          'GST Quizzes',
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
              return Gst101List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "GST101",
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
              return Gst102List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'GST102',
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
              return Gst103List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'GST103',
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
              return Gst105List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'GST105',
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
              return Gst106List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'GST106',
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
              return Gst108List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'GST108',
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
              return Gst110List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'GST110',
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
              return Gst202List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'GST202',
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
              return Gst203List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'GST203',
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
              return Gst204List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'GST204',
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
              return Gst205List();
            })),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'GST205',
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
        //   builder: (context) => QuizPlayGst(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayGst(
            quizId,
            'GST101',
            number,
            usern: provider,
            title: 'GST101 Quizes',
            storeName: 'Gst101',
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
        //   builder: (context) => QuizPlayGst(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayGst(
            quizId,
            'GST102',
            number,
            usern: null,
            title: 'GST102 Quizes',
            storeName: 'Gst102',
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
        //   builder: (context) => QuizPlayGst(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel4');

          return QuizPlayGst(
            quizId,
            'GST103',
            number,
            usern: null,
            title: 'GST103 Quizes',
            storeName: 'Gst103',
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
    final provider = Provider.of<EmailSignInProvider>(context);
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) => QuizPlayGst(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayGst(
            quizId,
            'GST105',
            number,
            usern: provider,
            title: 'GST105 Quizes',
            storeName: 'Gst105',
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

class QuizTile5 extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  // final int noOfQuestions;

  const QuizTile5({
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
        //   builder: (context) => QuizPlayGst(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayGst(
            quizId,
            'GST106',
            number,
            usern: null,
            title: 'GST106 Quizes',
            storeName: 'Gst106',
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

class QuizTile6 extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  // final int noOfQuestions;

  const QuizTile6({
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
        //   builder: (context) => QuizPlayGst(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel4');

          return QuizPlayGst(
            quizId,
            'GST108',
            number,
            usern: null,
            title: 'GST108 Quizes',
            storeName: 'Gst108',
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

class QuizTile7 extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  // final int noOfQuestions;

  const QuizTile7({
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
        //   builder: (context) => QuizPlayGst(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayGst(
            quizId,
            'GST110',
            number,
            usern: provider,
            title: 'GST110 Quizes',
            storeName: 'Gst110',
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

class QuizTile8 extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  // final int noOfQuestions;

  const QuizTile8({
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
        //   builder: (context) => QuizPlayGst(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayGst(
            quizId,
            'GST202',
            number,
            usern: null,
            title: 'GST202 Quizes',
            storeName: 'GST202',
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

class QuizTile9 extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  // final int noOfQuestions;

  const QuizTile9({
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
        //   builder: (context) => QuizPlayGst(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel4');

          return QuizPlayGst(
            quizId,
            'GST203',
            number,
            usern: null,
            title: 'GST203 Quizes',
            storeName: 'GST203',
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

class QuizTile10 extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  // final int noOfQuestions;

  const QuizTile10({
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
        //   builder: (context) => QuizPlayGst(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayGst(
            quizId,
            'GST204',
            number,
            usern: provider,
            title: 'GST204 Quizes',
            storeName: 'GST204',
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

class QuizTile11 extends StatelessWidget {
  final int number;
  final Color colour;
  final String quizId;
  // final int noOfQuestions;

  const QuizTile11({
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
        //   builder: (context) => QuizPlayGst(id)
        // ));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print('hel3');

          return QuizPlayGst(
            quizId,
            'GST205',
            number,
            usern: null,
            title: 'GST205 Quizes',
            storeName: 'GST205',
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
