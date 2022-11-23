import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Quiz/data/category.dart';
import 'package:space/screen/Quiz/data/user.dart';
import 'package:space/screen/Quiz/model/category.dart';
import 'package:space/screen/Quiz/result.dart';
import 'package:space/screen/Quiz/results_notlogin.dart';
import 'package:space/var.dart';

class QuizPlayCpe extends StatefulWidget {
  final String quizId;
  final String coll;
  final int number;
  final String title;
  final usern;
  final String storeName;
  const QuizPlayCpe(this.quizId, this.coll, this.number,
      {Key? key, required this.usern, required this.title, required this.storeName})
      : super(key: key);

  @override
  _QuizPlayCpeState createState() => _QuizPlayCpeState();
}

int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;
int total = 0;
Stream? infoStream;

class _QuizPlayCpeState extends State<QuizPlayCpe> {
  late QuerySnapshot questionSnaphot;

  /// Stream

  bool isLoading = true;
  // final user = usern;
  var Provider;

  @override
  void initState() {
    print("gggggggggggggg");

    getQuestionData(widget.quizId.trim(), widget.coll);

    infoStream ??=
        Stream<List<int>>.periodic(const Duration(milliseconds: 100), (x) {
      // print("this is x $x");
      return [_correct, _incorrect];
    });

    super.initState();
  }

  getQuestionData(String quizId, String coll) async {
    print('hi');
    print(quizId);
    print(coll);
    print('Phy');

    await FirebaseFirestore.instance
        .collection(coll)
        .doc(quizId)
        .collection("QNA")
        .get()
        .then((value) {
      questionSnaphot = value;
      _notAttempted = questionSnaphot.docs.length;
      _correct = 0;
      _incorrect = 0;
      isLoading = false;
      total = questionSnaphot.docs.length;

      setState(() {});
      print("init don $total $quizId ");
    });
  }

  QuestionModel getQuestionModelFromDatasnapshot(
      DocumentSnapshot questionSnapshot) {
    QuestionModel questionModel = QuestionModel();

    questionModel.question = questionSnapshot["question"];

    /// shuffling the options
    List<String> options = [
      questionSnapshot["option1"],
      questionSnapshot["option2"],
      questionSnapshot["option3"],
      questionSnapshot["option4"],
    ];
    options.shuffle();

    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctOption = questionSnapshot["option1"];
    questionModel.answered = false;

    print(questionModel.correctOption.toLowerCase());

    return questionModel;
  }

  @override
  void dispose() {
    infoStream == null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final username = widget.usern;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.red,
        brightness: Brightness.light,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? Container(
              child: const Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: Column(
                  children: [
                    InfoHeader(
                      length: questionSnaphot.docs.length,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    questionSnaphot.docs == null
                        ? Container(
                            child: const Center(
                              child: Text("No Data"),
                            ),
                          )
                        : ListView.builder(
                            itemCount: questionSnaphot.docs.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return QuizPlayCpeTile(
                                questionModel: getQuestionModelFromDatasnapshot(
                                    questionSnaphot.docs[index]),
                                index: index,
                              );
                            })
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              if (nameee.toString().isEmpty) {
                return Resul(
                    correct: _correct,
                    incorrect: _incorrect,
                    total: total,
                    number: widget.number);
              } else {
                FirebaseFirestore.instance
                    .collection("userData")
                    .doc(nameee)
                    .set(
                      ({
                        '${widget.storeName} module ${widget.number}': _correct,
                      }),
                      SetOptions(merge: true),
                    )
                    .then((value) => print("User Added"))
                    .catchError((error) => print("Failed to add user: $error"));
                return Results(
                    correct: _correct,
                    incorrect: _incorrect,
                    total: total,
                    number: widget.number);
              }
            }));
          }),
    );
  }
}

class InfoHeader extends StatefulWidget {
  final int length;

  const InfoHeader({Key? key, required this.length}) : super(key: key);

  @override
  _InfoHeaderState createState() => _InfoHeaderState();
}

class _InfoHeaderState extends State<InfoHeader> {
  @override
  void initState() {
    print("iiiii");

    infoStream =
        Stream<List<int>>.periodic(const Duration(milliseconds: 100), (x) {
      // print("this is x $x");
      return [_correct, _incorrect];
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: infoStream!,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 14),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: <Widget>[
                      NoOfQuestionTile(
                        text: "Total",
                        number: widget.length,
                        colour: Colors.red,
                      ),
                      NoOfQuestionTile(
                        text: "Correct",
                        number: _correct,
                        colour: Colors.red,
                      ),
                      NoOfQuestionTile(
                        text: "Incorrect",
                        number: _incorrect,
                        colour: Colors.red,
                      ),
                      NoOfQuestionTile(
                        text: "NotAttempted",
                        number: _notAttempted,
                        colour: Colors.red,
                      ),
                    ],
                  ),
                )
              : Container();
        });
  }
}

class QuizPlayCpeTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;

  const QuizPlayCpeTile(
      {Key? key, required this.questionModel, required this.index})
      : super(key: key);

  @override
  _QuizPlayCpeTileState createState() => _QuizPlayCpeTileState();
}

class _QuizPlayCpeTileState extends State<QuizPlayCpeTile> {
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Q${widget.index + 1} ${widget.questionModel.question}",
              style:
                  TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.8)),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option1 ==
                    widget.questionModel.correctOption) {
                  print(widget.questionModel.correctOption);
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: Column(
              children: [
                OptionTile(
                  option: "A",
                  description: widget.questionModel.option1,
                  correctAnswer: widget.questionModel.correctOption,
                  optionSelected: optionSelected,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option2 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTile(
              option: "B",
              description: widget.questionModel.option2,
              correctAnswer: widget.questionModel.correctOption,
              optionSelected: optionSelected,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option3 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTile(
              option: "C",
              description: widget.questionModel.option3,
              correctAnswer: widget.questionModel.correctOption,
              optionSelected: optionSelected,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option4 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTile(
              option: "D",
              description: widget.questionModel.option4,
              correctAnswer: widget.questionModel.correctOption,
              optionSelected: optionSelected,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
