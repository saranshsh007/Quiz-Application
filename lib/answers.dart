import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectorHandler;
  final String answerText;
  Answer(this.selectorHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          answerText,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          selectorHandler() ;
        },
      ),
    );
  }
}
