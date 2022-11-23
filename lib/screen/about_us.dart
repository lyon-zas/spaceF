import 'package:flutter/material.dart';
import 'package:space/screen/Quiz/quiz.dart';
import 'package:startapp/startapp.dart';

class AboutUs extends StatefulWidget {
  final VoidCallback openDrawer;
  const AboutUs({Key? key, required this.openDrawer}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late String about =
      '''Meaning fuoye space is a mobile application that provides fuoye student with computer based practise test questions to help in preperation for exams or test, Also providing a friendly competition for students to win amazing prizes. This is a product of TedTec Int which provides Technological solutions and services.
      ''';
  late String ceo =
      '''Orimolade Eyimofe is the CEO of TedTech a student of mechatronics Engineering Department, Who is pasionate about the technological and innovative space''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 5,
        title: const Text(
          "About Us",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: DrawerMenu(onClicked: widget.openDrawer),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 5, left: 10, right: 10),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'F',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "space ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ])),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Text(about,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          )),
                    ),
                    const Text('Contact Us for promotion or services @',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.mail_outline_rounded,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Tedtech@gmail.com",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ))
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.phone,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("08109063137",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ))
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                // Padding(
                                //   padding: const EdgeInsets.all(5.0),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: BoxDecoration(
                                //         color: Colors.grey,
                                //         borderRadius: BorderRadius.circular(5)),
                                //   ),
                                // ),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: 'M',
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "eet the CEO ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                ])),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Text(ceo,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const AdBanner()
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height / 3.4,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20),
          //         color: Colors.white,
          //         boxShadow: [
          //           BoxShadow(
          //               color: Colors.blueGrey.withOpacity(0.5),
          //               spreadRadius: 5,
          //               blurRadius: 7,
          //               offset: const Offset(0, 3))
          //         ]),
          //     child: Padding(
          //       padding: const EdgeInsets.all(20.0),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(5.0),
          //                 child: Container(
          //                   height: 50,
          //                   width: 50,
          //                   decoration: BoxDecoration(
          //                       color: Colors.grey,
          //                       borderRadius: BorderRadius.circular(5)),
          //                 ),
          //               ),
          //               const Text.rich(TextSpan(children: [
          //                 TextSpan(
          //                     text: 'M',
          //                     style: TextStyle(
          //                         color: Colors.amber,
          //                         fontSize: 22,
          //                         fontWeight: FontWeight.bold)),
          //                 TextSpan(
          //                     text: "eet the CEO ",
          //                     style: TextStyle(
          //                         color: Colors.black,
          //                         fontSize: 17,
          //                         fontWeight: FontWeight.bold)),
          //               ])),
          //             ],
          //           ),
          //           SizedBox(
          //             width: MediaQuery.of(context).size.width / 1.2,
          //             child: Text(ceo,
          //                 textAlign: TextAlign.start,
          //                 overflow: TextOverflow.fade,
          //                 style: const TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 17,
          //                 )),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
