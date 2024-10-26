import 'package:flutter/material.dart';
import 'questions.dart';

void main() => runApp(
      const Quizzler(),
    );

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.5,
            ),
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
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [
    const Icon(
      Icons.start_outlined,
      color: Colors.white,
    ),
  ];

  // List Of class Of Questions
  List<Questions> questionBank = [
    Questions(
      q: 'You can lead a cow down stairs but not up stairs.',
      a: false,
    ),
    Questions(
      q: 'Approximately one quarter of human bones are in the feet.',
      a: true,
    ),
    Questions(
      q: 'A slug\'s blood is green.',
      a: true,
    ),
  ];

  int questionNumber = 0;
  int theNumberOfQuestion = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '$theNumberOfQuestion) ${questionBank[questionNumber].questionText}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26.0,
            color: Colors.white,
          ),
        ),
        const Divider(
          color: Colors.transparent,
          height: 55.5,
        ),
        ElevatedButton(
          onPressed: () {
            //The user picked true.
            bool correctAnswer = questionBank[questionNumber].questionAnswer;

            if (correctAnswer == true) {
              print('It is Right');
            } else {
              print('it is wrong');
            }

            setState(
              () {
                theNumberOfQuestion++;
                questionNumber++;
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 120.0,
            ),
          ),
          child: const Text(
            'True',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        const Divider(
          color: Colors.transparent,
          height: 55.5,
        ),
        ElevatedButton(
          onPressed: () {
            //The user picked false.
            bool correctAnswer = questionBank[questionNumber].questionAnswer;

            if (correctAnswer == false) {
              print('It is Right');
            } else {
              print('it is wrong');
            }
            setState(
              () {
                theNumberOfQuestion++;
                questionNumber++;
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 120.0,
            ),
          ),
          child: const Text(
            'False',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        const Divider(
          color: Colors.transparent,
          height: 55.5,
        ),
        Row(
          children: scoreKeeper, // End Of CHildren
        )
      ],
    );
  }
}
