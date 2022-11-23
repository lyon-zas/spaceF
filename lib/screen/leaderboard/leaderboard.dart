// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space/screen/Quiz/quiz.dart';
import 'package:startapp/startapp.dart';

import 'leaderboard_table.dart';

class Leaderboard extends StatefulWidget {
  final VoidCallback openDrawer;
  const Leaderboard({Key? key, required this.openDrawer}) : super(key: key);

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Leaderboard",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 5,
        leading: DrawerMenu(onClicked: widget.openDrawer),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 20,
            // ),
            // GestureDetector(
            //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const LeaderBoardTest())),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(20),
            //     child: Container(
            //       height: MediaQuery.of(context).size.height / 2.7,
            //       width: MediaQuery.of(context).size.width,
            //       color: Colors.orange,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           const Icon(
            //             FontAwesomeIcons.pencilAlt,
            //             color: Colors.black,
            //             size: 35,
            //           ),
            //           const Text(
            //             "Leaderboard Test",
            //             style: TextStyle(
            //                 fontSize: 24,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white),
            //           ),
            //           const Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 1.0),
            //             child:  Text(
            //               "Attempt leaderboard test in any course to compete for top positions to win amazing prices",
            //               style: TextStyle(
            //                 fontSize: 18,
            //                 color: Colors.white70,
            //               ),
            //               textAlign: TextAlign.center,
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 25,
            // ),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const LeaderboardTable())),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          FontAwesomeIcons.trophy,
                          color: Colors.black,
                          size: 35,
                        ),
                        const Text(
                          "View Leaderboard",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.0),
                          child: Text(
                            "View current position on the leaderboard and compete for top positions to win amazing prices",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AdBanner()
          ],
        ),
      ),
    );
  }
}
