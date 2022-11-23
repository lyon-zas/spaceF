import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:space/screen/Quiz/question/math/play_quiz_math.dart';
import 'package:space/screen/Quiz/quiz.dart';
import 'package:space/var.dart';
import 'package:startapp/startapp.dart';

class Score extends StatefulWidget {
  final VoidCallback openDrawer;
  const Score({Key? key, required this.openDrawer}) : super(key: key);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  Map? table = {};
  List<Widget> scoreWidget = [];
  int totalScore = 0;

  @override
  void initState() {
    getScores();
    super.initState();
  }

  submitScore() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(nameee)
        .set(
          ({
            'Total Score': totalScore,
            'name': nameee,
          }),
          SetOptions(merge: true),
        )
        .then((value) => print("Total Score Added"))
        .catchError((error) => print("Failed to add score: $error"));
  }

  getScores() async {
    await FirebaseFirestore.instance
        .collection('userData')
        .doc(nameee)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      print('documentSnapshot');
      if (documentSnapshot.exists) {
        table = documentSnapshot.data() as Map?;
        print('get doccc');

        print(table);
        table!.forEach((key, value) {
          totalScore += value as int;
          scoreWidget.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text(key.toString()), Text(value.toString())],
            ),
          );
        });
      }
    }).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    void showSnackBar(String content) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(content),
          duration: Duration(milliseconds: 1500),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Score",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 5,
        leading: DrawerMenu(onClicked: widget.openDrawer),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView(
          children: [
            divider(),
            Container(
              color: Colors.amber[200],
              child: Column(
                children: [
                  Column(
                    children: scoreWidget,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Total"),
                      Text(totalScore.toString())
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: GestureDetector(
                  onTap: () {
                    print(totalScore.toString());
                    submitScore();
                    showSnackBar("Total score succefully added....");
                    var snackBar = const SnackBar(
                      backgroundColor: Colors.amber,
                      elevation: 5,
                      content: Text('Total score succefully added....',
                          textAlign: TextAlign.center),
                      duration: Duration(milliseconds: 2000),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Submit score to Leaderboard",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16))),
                  )),
            ),
            const Align(
              child: AdBanner(),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
    );
  }

  Widget divider() => const Divider(
        color: Colors.grey,
        thickness: 2,
      );
}
