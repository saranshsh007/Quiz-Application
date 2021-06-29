import 'package:flutter/material.dart';
import 'answers.dart';
import 'question.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _quesIndex = 0;
  var counter = 1;
  var tscore = 0;

  void count() {
    setState(() {
      counter++;
    });
    print(counter);
  }

  void answerQuestion(int score) {
    tscore = tscore + score;
    setState(() {
      counter++;
    });
    setState(() {
      _quesIndex = _quesIndex + 1;
    });
    print(_quesIndex);
  }

  @override
  Widget build(BuildContext context) {
    final question = const [
      {
        'qText': 'How many time zones are there in Russia?',
        'answers': [
          {'Text': '10', 'Score': '10'},
          {'Text': '11', 'Score': '9'},
          {'Text': '12', 'Score': '30'},
          {'Text': '13', 'Score': '40'}
        ],
      },
      {
        'qText': 'What’s the national flower of Japan?',
        'answers': [
          {'Text': 'Rose', 'Score': 20},
          {'Text': 'Sunflower', 'Score': 30},
          {'Text': 'Cherry Blossom', 'Score': 9},
          {'Text': 'Lilly', 'Score': 40}
        ]
      },
      {
        'qText': 'How many stripes are there on the US flag?',
        'answers': [
          {'Text': '13', 'Score': 9},
          {'Text': '17', 'Score': 30},
          {'Text': '27', 'Score': 35},
          {'Text': '19', 'Score': 40}
        ],
      },
      {
        'qText': 'What’s the national animal of Australia?',
        'answers': [
          {'Text': 'Lion', 'Score': 20},
          {'Text': 'Tiger', 'Score': 30},
          {'Text': 'Kangaroo', 'Score': 9},
          {'Text': 'Rhino', 'Score': 40}
        ],
      },
      {
        'qText': 'How many days does it take for the Earth to orbit the Sun?',
        'answers': [
          {'Text': '336', 'Score': 20},
          {'Text': '365', 'Score': 9},
          {'Text': '345', 'Score': 30},
          {'Text': '375', 'Score': 40}
        ],
      },
      {
        'qText': 'Which of the following empires had no written language:',
        'answers': [
          {'Text': 'Ican', 'Score': 10},
          {'Text': 'Aztec', 'Score': 20},
          {'Text': 'Egyptian', 'Score': 30},
          {'Text': 'Roman', 'Score': 40}
        ],
      },
      {
        'qText': 'Until 1923, what was the Turkish city of Istanbul called?',
        'answers': [
          {'Text': 'Ankara', 'Score': 20},
          {'Text': 'Izmir', 'Score': 30},
          {'Text': 'Gaziantep', 'Score': 40},
          {'Text': 'Constantinople', 'Score': 9}
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          centerTitle: true,
          title: Text(
            'Quiz App',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        ),
        body: _quesIndex < question.length
            ? Column(
                children: [
                  Questions(
                    'Q $counter : ' + question[_quesIndex]['qText'].toString(),
                  ),
                  ...(question[_quesIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(
                        ()=> answerQuestion(answer['Score']), answer['Text'].toString());
                  }).toList()
                ],
              )
            : Result(tscore),
      ),
    );
  }
}
