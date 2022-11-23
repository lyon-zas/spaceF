// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/auth.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Auth/sign_in.dart';
import 'package:space/screen/Quiz/quiz.dart';
import 'package:space/screen/drawer/drawe_item.dart';
import 'package:space/var.dart';

class DrawerWidget extends StatefulWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  const DrawerWidget({Key? key, required this.onSelectedItem})
      : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final provider = Provider.of<EmailSignInProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(21, 30, 61, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3))
                      ]),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  child: Row(
                    children: [
                      auth.currentUser != null
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                child: Icon(Icons.person),
                                //  Image.asset(
                                //   "assets/space.jpg",
                                // ,
                                // ),
                                radius: 20,
                                backgroundColor: Colors.white,
                              ),
                            )
                          : Container(),

                      // ,
                      const SizedBox(
                        width: 5,
                      ),
                      auth.currentUser != null
                          ? Text(
                              "${provider.middlename}${' '}${provider.surname}",
                              // "Eyimofe Orimolade",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          : const Text(
                              "Fuoye Space",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 32, 13, 0),
            child: SingleChildScrollView(
              child: BuildDrawerItem(context),
            ),
          ),
          GestureDetector(
            onTap: auth.currentUser != null
                ? () {
                    FirebaseAuth.instance.signOut().then((value) {
                      nameee = null;
                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const MainPage()));
                    });
                  }
                : () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const AuthScreen())),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 32, 13, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ]),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width / 2.3,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.exit_to_app, color: Colors.white),
                    provider.auth.currentUser != null
                        ? const Text('Logout',
                            style: TextStyle(color: Colors.white, fontSize: 18))
                        : const Text('Login',
                            style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildDrawerItem(BuildContext context) => Column(
        children: DrawerItems.all
            .map((item) => ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  leading: Icon(item.icon, color: Colors.white),
                  title: Text(
                    item.title,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () => widget.onSelectedItem(item),
                ))
            .toList(),
      );
}

class DrawerItem {
  final String title;
  final IconData icon;

  const DrawerItem({required this.title, required this.icon});
}
