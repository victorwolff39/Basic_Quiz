import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

main() => runApp(FormApp());

class _FormAppState extends State<FormApp> {
  var _selectedQuestion = 0;
  var _totalPoints = 0;
  final List<Map<String, Object>> _questions = const [
    {
      "text": "How is the auxiliary generator called in a airliner?",
      "answers": [
        {"text": "Generator", "points": 0},
        {"text": "Turbine", "points": 0},
        {"text": "APU", "points": 1},
        {"text": "Engine", "points": 0}
      ]
    },
    {
      "text":
          "What is the light you need to activate before turning on the engines?",
      "answers": [
        {"text": "Nav light", "points": 0},
        {"text": "Beacon light", "points": 1},
        {"text": "Logo light", "points": 0},
        {"text": "Taxi lights", "points": 0}
      ]
    },
    {
      "text": "What does auto trim do?",
      "answers": [
        {"text": "Trim the aircraft", "points": 1},
        {"text": "Control the speed", "points": 0},
        {"text": "Control the heading", "points": 0},
        {"text": "Manage the altitude", "points": 0}
      ]
    }
  ];

  bool get hasQuestionsToDisplay {
    return _selectedQuestion < _questions.length;
  }

  void _answer(int points) {
    if (hasQuestionsToDisplay) {
      setState(() {
        _selectedQuestion++;
        _totalPoints += points;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalPoints = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Questions"),
            centerTitle: true,
          ),
          body: hasQuestionsToDisplay
              //If there are questions that need to be answered:
              ? Quiz(
                  selectedQuestion: _selectedQuestion,
                  answer: _answer,
                  questions: _questions,
                )
              //If there are no more questions to display:
              : Result(_totalPoints, _restartQuiz)),
    );
  }
}

class FormApp extends StatefulWidget {
  @override
  _FormAppState createState() {
    return _FormAppState();
  }
}
