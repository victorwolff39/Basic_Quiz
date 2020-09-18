import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  Answer(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableLenght = mediaQuery.size.width;

    return Container(
      width: availableLenght * 0.5,
      //width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}
