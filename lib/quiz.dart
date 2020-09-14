import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) answer;

  Quiz({
    @required this.selectedQuestion,
    @required this.answer,
    @required this.questions,
  });

  bool get hasQuestionsToDisplay {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasQuestionsToDisplay ? questions[selectedQuestion]["answers"] : null;

    return Column(
      children: [
        Question(questions[selectedQuestion]["text"]),
        ...answers.map((e) {
          return Answer(e["text"], () => answer(e["points"]));
        }).toList(),
      ],
    );
  }
}
