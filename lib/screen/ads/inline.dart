import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

class InlineAds extends StatefulWidget {
  const InlineAds({Key? key}) : super(key: key);

  @override
  _InlineAdsState createState() => _InlineAdsState();
}

double ht = 0.0, wdt = 0.0;

class _InlineAdsState extends State<InlineAds> {
  // late String _click;
  // late String _description;
  // late String _link;
  // late String _name;

  // void initState() {
  //   super.initState();

  //   Firebase.initializeApp().whenComplete(() {
  //     print("completed");
  //   });

  //   getData();
  // }

  // Future getData() async {
  //   print('get dataaaa');

  //   await FirebaseFirestore.instance
  //       .collection('Ads')
  //       .doc("7QwFYP1VZY75atbi7DBj")
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) async {
  //     if (documentSnapshot.exists) {
  //       print('get doccc');
  //       print('Document data: ${documentSnapshot.data()}');
  //       try {
  //         _click = documentSnapshot.get(FieldPath(const ['click']));
  //         _description = documentSnapshot.get(FieldPath(const ['description']));
  //         _link = documentSnapshot.get(FieldPath(const ['link']));
  //         _name = documentSnapshot.get(FieldPath(const ['name']));
  //         print(documentSnapshot.get(FieldPath(const ['name'])));
  //       } catch (err) {
  //         print(err);

  //         return false;
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height / 1000;
    wdt = MediaQuery.of(context).size.width / 1000;
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        height: ht * 140,
        width: wdt * 1000,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/inline.jpg"),
            // You can add Network Image as well
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: wdt * 20, top: ht * 15, right: wdt * 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: wdt * 5, vertical: ht * 2),
                      decoration: BoxDecoration(
                        color: Colors.yellow[600],
                        borderRadius: const BorderRadius.all(
                          (Radius.circular(3)),
                        ),
                      ),
                      child: const Text(
                        "Ad",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: ht * 2),
                    child: Text(
                      // _name,
                      "Approtechs",
                      style: TextStyle(
                        letterSpacing: 0.3,
                        color: Colors.grey[200],
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ht * 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wdt * 7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // _description,
                      "Aptitude Solutions - AptiSoln",
                      style: TextStyle(color: Colors.grey[200]),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // You can add your website or app link
                        _launch(
                            "https://play.google.com/store/apps/details?id=com.swaraj.AptiSoln");
                        // routes(context, Welcome());
                      },
                      child: Text(
                        // _click,
                        "Install",
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                        color: Colors.grey.shade200,
                        style: BorderStyle.solid,
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  routes(context, classes) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => classes,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        transitionDuration: Duration(milliseconds: 2000),
      ),
    );
  }
}
