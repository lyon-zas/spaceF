// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:space/screen/Quiz/model/category.dart';

class OptionTile extends StatefulWidget {
  final String option, description, correctAnswer, optionSelected;

  OptionTile(
      {Key? key,
      required this.description,
      required this.correctAnswer,
      required this.option,
      required this.optionSelected})
      : super(key: key);
  QuestionModel questionModel = QuestionModel();
  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  void initState() {
    print("iiiii");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: widget.optionSelected == widget.description
              ? widget.description == widget.correctAnswer
                  ? Colors.green.withOpacity(0.7)
                  : Colors.red.withOpacity(0.7)
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 28,
                  width: 28,
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //         color: widget.optionSelected == widget.description
                  //             ? widget.description == widget.correctAnswer
                  //                 ? Colors.green.withOpacity(0.7)
                  //                 : Colors.red.withOpacity(0.7)
                  //             : Colors.grey,
                  //         width: 1.5),
                  //     color: widget.optionSelected == widget.description
                  //         ? widget.description == widget.correctAnswer
                  //             ? Colors.green.withOpacity(0.7)
                  //             : Colors.red.withOpacity(0.7)
                  //         : Colors.white,
                  //     borderRadius: BorderRadius.circular(24)),
                  child: Text(
                    widget.option,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.optionSelected == widget.description
                          ? Colors.white
                          : Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Text(
                    widget.description,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                )
              ],
            ),
            buildSolution()
          ],
        ),
      ),
    );
  }

  Widget buildSolution() {
    if (widget.optionSelected == widget.description) {
      return Text(
        "The answer is ${widget.correctAnswer}",
        style: const TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
      );
    } else {
      return Container();
    }
  }
}

class NoOfQuestionTile extends StatefulWidget {
  final String text;
  final int number;
  final Color colour;

  const NoOfQuestionTile({Key? key, required this.text, required this.number, required this.colour})
      : super(key: key);
  
  @override
  // final color = colour;
  _NoOfQuestionTileState createState() => _NoOfQuestionTileState();
}

class _NoOfQuestionTileState extends State<NoOfQuestionTile> {
  
  @override
  
  Widget build(BuildContext context) {
    // final color = widget.colour;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14)),
                color: widget.colour),
            child: Text(
              "${widget.number}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
                color: Colors.black54),
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
