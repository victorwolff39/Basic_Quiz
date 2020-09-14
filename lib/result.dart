import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int points;
  final void Function() restartQuiz;

  Result(this.points, this.restartQuiz);

  List<Widget> result(int points) {
    String _counter, _message;
    Color _color;

    switch (points) {
      case 0:
        _counter = "0/3";
        _color = Colors.red;
        _message = "You need to study!";
        break;
      case 1:
        _counter = "1/3";
        _color = Colors.orange;
        _message = "You need to practice!";
        break;
      case 2:
        _counter = "2/3";
        _color = Colors.yellow;
        _message = "Good... But can be better!";
        break;
      case 3:
        _counter = "3/3";
        _color = Colors.green;
        _message = "Perfect!!";
        break;
    }

    return [
      Text(
        _counter,
        style: TextStyle(fontSize: 42, color: _color),
      ),
      Text(
        _message,
        style: TextStyle(fontSize: 18),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: result(points).elementAt(0)),
        Center(child: result(points).elementAt(1)),
        FlatButton(
          child: Text("Restart?"),
          textColor: Colors.blue,
          onPressed: restartQuiz,
        ),
      ],
    );
  }
}
