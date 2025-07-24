import 'QuestionsBrain.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(Quizzler());
}

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
  _QuizPageState createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  Icon checkQuestion(bool resp, bool q) {
    if (q == resp) {
      score += 10;
      return Icon(Icons.check, color: Colors.green);
    } else {
      score -= 10;
      return Icon(Icons.close, color: Colors.red);
    }
  }

  int score = 0;
  QuestionsBrain q = QuestionsBrain();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              "Score : $score",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  q.getQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(),
                ),

                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () {
                  //The user picked true.
                  setState(() {
                    scoreKeeper.add(
                      checkQuestion(true, q.getQuestionResponse()),
                    );
                    q.NextQuestion();
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(),
                ),

                child: Text(
                  'False',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: () {
                  //The user picked false.
                  setState(() {
                    scoreKeeper.add(
                      checkQuestion(false, q.getQuestionResponse()),
                    );
                    q.NextQuestion();
                  });
                },
              ),
            ),
          ),
          Row(children: scoreKeeper),
        ],
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
