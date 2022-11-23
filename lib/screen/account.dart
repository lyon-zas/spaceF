import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Quiz/quiz.dart';
import 'package:startapp/startapp.dart';

class Account extends StatefulWidget {
  final VoidCallback openDrawer;
  const Account({Key? key, required this.openDrawer}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);
    return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text(
            'My Profile',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          leading: DrawerMenu(onClicked: widget.openDrawer),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          Text(
                            "${provider.middlename}${' '}${provider.surname}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 2,
                                color: Colors.orange[300],
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Profile Information",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    Row(
                                      children: [
                                        const FaIcon(
                                          FontAwesomeIcons.at,
                                          color: Colors.green,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Email",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              provider.userEmail,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        )
                                      ],
                                    ),

                                    ////////
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          color: Colors.green,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Username",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              provider.userName,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        const FaIcon(
                                          FontAwesomeIcons.key,
                                          color: Colors.green,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Change Password",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text("Tap to update password",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.black87))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                          const AdBanner()
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.center,
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
