import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'question.dart';

class Category {
  final String categoryName;
  final String categoryPname;
  final String description;
  final Color backgroundColor;
  final IconData icon;
  final List<Question> questions;
  final String imageUrl;

  Category({
    required this.imageUrl,
    required this.questions,
    required this.categoryName,
    required this.categoryPname,
    this.description = '',
    this.backgroundColor = Colors.orange,
    this.icon = FontAwesomeIcons.question,
  });
}

class QuestionModel{

  late String question;
  late String option1;
  late String option2;
  late String option3;
  late String option4;
  late String correctOption;
  late bool answered;
}
