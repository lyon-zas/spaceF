import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space/var.dart';
import 'package:startapp/startapp.dart';

class LeaderboardTable extends StatelessWidget {
  const LeaderboardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Leaderboard Table",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: LeaderBoard(),

      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      //   child: Column(
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: const [
      //           Text('Position'),
      //           // Icon(FontAwesomeIcons.trophy),
      //           Text("Username"),
      //           Text.rich(TextSpan(children: [TextSpan(text: "points")])),
      //         ],
      //       ),
      //       Container(
      //         color: Colors.orange[200],
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: const [
      //             Text('1'),
      //             Icon(FontAwesomeIcons.trophy),
      //             Text("Ted"),
      //             Text.rich(TextSpan(children: [
      //               TextSpan(text: '200 '),
      //               TextSpan(text: "points")
      //             ])),
      //           ],
      //         ),
      //       ),
      //       divider()
      //     ],
      //   ),
      // ),
    );
  }

  Widget divider() => const Divider(
        color: Colors.grey,
        thickness: 2,
      );
}

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  void initState() {
    StartApp.showInterstitialAd();
    super.initState();
    //getScores();
  }

  // getScores() {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .orderBy('Total Score', descending: true)
  //       .get();
  // }

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .orderBy('Total Score', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        int i = 0;
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            i++;
            return Column(
              children: [
                SizedBox(height: 15),
                Divider(),
                Container(
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(i.toString()),
                            Text(data['name'].toString()),
                            Text(data['Total Score'].toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
