import 'package:flutter/cupertino.dart';
import 'package:space/mockdata/modeldata.dart';



class Question {
  final String text;
  final List<Option> options;
  final String solution;
  bool isLocked;
  Option selectedOption;

  Question({
    required this.text,
    required this.options,
    required this.solution,
    this.isLocked = false,
    required this.selectedOption,
  });
}
