import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Which is the biggest single living cell?',
      'answers': [
        {'text': 'Amoeba', 'score': 0},
        {'text': 'Ostrich Egg', 'score': 1},
        {'text': 'White Blood Cells', 'score': 0},
        {'text': 'None of these', 'score': 0},
      ],
    },
    {
      'questionText':
          'which among these can survive without thier head for 9 days?',
      'answers': [
        {'text': 'GrassHoppert', 'score': 0},
        {'text': 'Earthworm', 'score': 0},
        {'text': 'Cockroach', 'score': 1},
        {'text': 'None of these', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which amimal can see all of it\'s four legs at the same time?',
      'answers': [
        {'text': 'Donkey', 'score': 1},
        {'text': 'Cheetah', 'score': 0},
        {'text': 'Elephant', 'score': 0},
        {'text': 'Giraffe', 'score': 0},
      ],
    },
    {
      'questionText': 'What sea creature is a blue whale\'s favourite meal? ',
      'answers': [
        {'text': 'shark', 'score': 0},
        {'text': 'Crab', 'score': 0},
        {'text': 'Plankton', 'score': 0},
        {'text': 'Krill', 'score': 1},
      ],
    },
    {
      'questionText': 'Which mammal has the most powerful bite in the world ?',
      'answers': [
        {'text': 'Tiger', 'score': 0},
        {'text': 'Hippopotamus', 'score': 1},
        {'text': 'Crocodile', 'score': 0},
        {'text': 'Pirahna', 'score': 0},
      ],
    },
    {
      'questionText': 'which is the slowest animal in the world?',
      'answers': [
        {'text': 'Snail', 'score': 0},
        {'text': 'Turtle', 'score': 0},
        {'text': 'Sloth', 'score': 1},
        {'text': 'Ant', 'score': 0},
      ],
    },
    {
      'questionText': 'Which bird can fly backwards?',
      'answers': [
        {'text': 'HummingBird', 'score': 1},
        {'text': 'Eagle', 'score': 0},
        {'text': 'SunBird', 'score': 0},
        {'text': 'Owls', 'score': 0},
      ],
    },
    {
      'questionText': 'Which of the following is used in pencils?',
      'answers': [
        {'text': 'Graphite', 'score': 1},
        {'text': 'Silicon', 'score': 0},
        {'text': 'Charcoal', 'score': 0},
        {'text': 'Phosphorous', 'score': 0}
      ],
    },
    {
      'questionText': 'Plants receive their nutrients mainly from?',
      'answers': [
        {'text': 'chlorophyll', 'score': 0},
        {'text': 'atmosphere', 'score': 0},
        {'text': 'Light', 'score': 0},
        {'text': 'Soil', 'score': 1}
      ],
    },
    {
      'questionText': ' One of the following is not a function of bones.?',
      'answers': [
        {'text': 'Place for muscle attachment', 'score': 0},
        {'text': 'Protection of vital organs', 'score': 0},
        {
          'text':
              'Secretion of hormones for calcium regulation in blood and bones',
          'score': 1
        },
        {'text': 'Production of blood corpuscles', 'score': 0}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
