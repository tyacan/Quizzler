import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  questionNumber++;
                  bool correctAnswer = answers[questionNumber];
                  correctAnswer == true
                      ? scoreKeeper.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ))
                      : scoreKeeper.add(Icon(
                          Icons.close,
                          color: Colors.red,
                        ));
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  questionNumber++;
                  bool correctAnswer = answers[questionNumber];
                  correctAnswer == false
                      ? scoreKeeper.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ))
                      : scoreKeeper.add(Icon(
                          Icons.close,
                          color: Colors.red,
                        ));
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }

  List<Icon> scoreKeeper = [
    // Ex: 
    // Icon(Icons.check, color: Colors.green),
    // Icon(Icons.close, color: Colors.red),
  ];

  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'A slug\'s blood is green.1',
    'A slug\'s blood is green.2',
    'A slug\'s blood is green.3',
    'A slug\'s blood is green.4',
    'A slug\'s blood is green.5',
  ];

  List<bool> answers = [
    false,
    false,
    false,
    true,
    true,
    true,
  ];

  // What is the current number of question

  int questionNumber = 0;
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
