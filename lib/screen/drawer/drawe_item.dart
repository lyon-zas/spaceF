import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space/screen/drawer/drawer.dart';

class DrawerItems {
  static const DrawerItem home =
      DrawerItem(title: 'Home', icon: FontAwesomeIcons.home);

  static const DrawerItem leaderboard =
      DrawerItem(title: 'leaderboard', icon: FontAwesomeIcons.trophy);
  static const DrawerItem score =
      DrawerItem(title: 'Score', icon: Icons.score_rounded);
  static const DrawerItem account =
      DrawerItem(title: 'Account', icon: Icons.account_circle);
  static const DrawerItem about =
      DrawerItem(title: 'About Us', icon: Icons.info_rounded);
  
  static const List<DrawerItem> all = [
    home,
    leaderboard,
    score,
    account,
    about
  ];
}
