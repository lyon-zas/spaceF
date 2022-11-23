// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/auth.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Quiz/question/bio/bio_collection.dart';
import 'package:space/screen/Quiz/question/chm/chem_collect.dart';
import 'package:space/screen/Quiz/question/cpe/cpe_collection.dart';
import 'package:space/screen/Quiz/question/gst/gst.dart';
import 'package:space/screen/Quiz/question/math/math_collection.dart';
import 'package:space/screen/Quiz/question/phy/physics_collec.dart';
import 'package:space/screen/about_us.dart';
import 'package:space/screen/account.dart';
import 'package:space/screen/drawer/drawe_item.dart' as a;
import 'package:space/screen/drawer/drawer.dart';
import 'package:space/screen/leaderboard/leaderboard.dart';
import 'package:space/screen/popular.dart';
import 'package:space/screen/score.dart';
import 'package:space/var.dart';

import '../drawer/drawe_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double xOffset;
  late double yOffset;
  late double scalefactor;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItems.home;
  bool isdragging = false;

  late String _click;
  late String _description;
  late String _link;
  late String _name;

  Future getData() async {
    print('get dataaaa');

    await FirebaseFirestore.instance
        .collection('Ads')
        .doc("7QwFYP1VZY75atbi7DBj")
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        print('get doccc');
        print('Document data: ${documentSnapshot.data()}');
        try {
          _click = documentSnapshot.get(FieldPath(const ['click']));
          _description = documentSnapshot.get(FieldPath(const ['description']));
          _link = documentSnapshot.get(FieldPath(const ['link']));
          _name = documentSnapshot.get(FieldPath(const ['name']));
          print(documentSnapshot.get(FieldPath(const ['name'])));
        } catch (err) {
          print(err);

          return false;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();

    closeDrawer();
  }

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scalefactor = 1;
        isDrawerOpen = false;
      });

  void openDrawer() {
    setState(() {
      xOffset = 230;
      yOffset = 150;
      scalefactor = 0.7;
      isDrawerOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    nameee = Provider.of<EmailSignInProvider>(context).userName;

    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 30, 61, 1),
      body: Stack(
        children: [
          buildDrawer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white30,
            ),
            transform: Matrix4.translationValues(220, 160, 0.75)
              ..scale(scalefactor),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white12,
            ),
            transform: Matrix4.translationValues(210, 170, 0.77)
              ..scale(scalefactor),
          ),
          buildPage(),
        ],
      ),
    );
  }

  Widget buildDrawer() => SafeArea(
          child: Container(
        width: xOffset,
        child: DrawerWidget(
          onSelectedItem: (item) {
            setState(() => this.item = item);
            closeDrawer();
          },
        ),
      ));
  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isdragging = false,
        onHorizontalDragUpdate: (details) {
          if (isdragging) return;
          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
          isdragging = false;
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 270),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scalefactor),
          child: AbsorbPointer(
              absorbing: isDrawerOpen,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                child: Container(
                    color: isDrawerOpen
                        ? Colors.white12
                        : Color.fromRGBO(21, 30, 61, 1),
                    child: getDrawerPage()),
              )),
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.leaderboard:
        return Leaderboard(openDrawer: openDrawer);
      case DrawerItems.score:
        return Score(
          openDrawer: openDrawer,
        );
      case DrawerItems.account:
        return Account(
          openDrawer: openDrawer,
        );
      case DrawerItems.about:
        return AboutUs(
          openDrawer: openDrawer,
        );
      case DrawerItems.home:
      default:
        return Quiz(openDrawer: openDrawer);
    }
  }
}

///// Quiz
class Quiz extends StatefulWidget {
  final VoidCallback openDrawer;

  const Quiz({Key? key, required this.openDrawer}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);
    print(provider.userEmail);
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5,
        leading: DrawerMenu(onClicked: widget.openDrawer),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                provider.auth.currentUser != null
                    ? Text.rich(TextSpan(children: [
                        TextSpan(
                          text: 'Hello ',
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        TextSpan(
                          text: provider.userName,
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ]))
                    : Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
              ],
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Color.fromRGBO(21, 30, 61, 1),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: SizedBox(
              height: 450,
              child: GridView(
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PhysicsCollection())),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.rocket,
                                color: Colors.white, size: 36),
                            const SizedBox(height: 12),
                            Text(
                              'Physics',
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
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ChemistryCollection())),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.atom,
                                color: Colors.white, size: 36),
                            const SizedBox(height: 12),
                            Text(
                              'Chemistry',
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
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MathCollection())),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.squareRootAlt,
                                color: Colors.white, size: 36),
                            const SizedBox(height: 12),
                            Text(
                              'Maths',
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
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  GstCollection())),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.book,
                                color: Colors.white, size: 36),
                            const SizedBox(height: 12),
                            Text(
                              'GST',
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
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BiologyCollection())),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.dna,
                                color: Colors.white, size: 36),
                            const SizedBox(height: 12),
                            Text(
                              'Biology',
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
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CPECollection())),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.code,
                                color: Colors.white, size: 36),
                            const SizedBox(height: 12),
                            Text(
                              'CPE',
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
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Popular',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(height: 240, child: popularBuild(context))
                ])),
          )
        ],
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  final VoidCallback onClicked;
  const DrawerMenu({Key? key, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
      icon: FaIcon(
        FontAwesomeIcons.alignLeft,
        color: Colors.white,
        size: 19,
      ),
      onPressed: onClicked);
}

Widget popularBuild(BuildContext context) => ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: EdgeInsets.only(right: 10),
            width: MediaQuery.of(context).size.width * 0.65,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PhysicsCollection())),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage('assets/physics.png')),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Physics',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 4),
              Text(
                'Practice questions from various chapters in physics',
                style: TextStyle(fontSize: 16),
              )
            ]),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ChemistryCollection())),
            child: Container(
              padding: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image: AssetImage('assets/chemistry.png')),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Chemistry',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Practice questions from various chapters in chemistry',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MathCollection())),
            child: Container(
              padding: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image: AssetImage('assets/maths.png')),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Math',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Practice questions from various chapters in maths',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => BiologyCollection())),
            child: Container(
              padding: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image: AssetImage('assets/biology.png')),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Biology',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Practice questions from various chapters in maths',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ]);
