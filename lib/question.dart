import 'package:flutter/material.dart';
class Questions extends StatelessWidget {
 final String questionText;
  Questions(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Text(questionText, style: TextStyle(
     fontSize: 40,
     fontWeight: FontWeight.bold
    ),);
  }
}
