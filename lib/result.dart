import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore ;

  Result(this.resultScore);
  String get resultPhrase {
    String resultText;
    if(resultScore <= 8){
      resultText  = 'You are intelligent';
    }
    else if(resultScore <=12)
    {
      resultText = 'you\'r pretty likeable';
    }
    else if(resultScore <=16)
    {
      resultText = 'you\'r bad';
    }
    else
      resultText = 'you need a school';

    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(resultPhrase ,style: TextStyle(
        fontSize: 45,
        backgroundColor: Colors.red,
        fontWeight: FontWeight.bold
    ),));;
  }
}
