import 'package:flutter/material.dart';

class LeaderBoardTest extends StatelessWidget {
  const LeaderBoardTest({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Leaderboard Test",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 5,
        leading:  IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded),onPressed: () => Navigator.pop(context), ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}