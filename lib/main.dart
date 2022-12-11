import 'package:flutter/material.dart';
import 'package:quizzler_app/question.dart';
import 'package:quizzler_app/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      quizBrain.nextQuestion();
    });
  }

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];

  // List<bool> answers = [false, true, true];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'true',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'false',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

// Question('Some cats are actually allergic to humans', true),
//     Question('You can lead a cow down stairs but not up stairs.', false),
//     Question('Approximately one quarter of human bones are in the feet.', true),
//     Question('A slug\'s blood is green.', true),
//     Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
//     Question('It is illegal to pee in the Ocean in Portugal.', true),
//     Question(
//         'No piece of square dry paper can be folded in half more than 7 times.',
//         false),
//     Question(
//         'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
//         true),
//     Question(
//         'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
//         false),
//     Question(
//         'The total surface area of two human lungs is approximately 70 square metres.',
//         true),
//     Question('Google was originally called \"Backrub\".', true),
//     Question(
//         'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
//         true),
//     Question(
//         'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
//         true),
