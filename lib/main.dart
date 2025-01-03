import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

void main() => runApp(
      const Quizzler(),
    );

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
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
  QuizBrain quizBrain = QuizBrain(); // Create An Object of QuizBrain

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    //The user picked false.
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Game Is Over!",
          desc: "All Questions Have Been Answered!",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              color: Colors.grey.shade900,
              child: Text(
                "Try Again",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ).show();
        quizBrain.resetAll();
        scoreKeeper.clear();
      } else {
        if (userAnswer == correctAnswer) {
          // ignore: avoid_print
          print('It is Right');
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
              semanticLabel: 'check mark as true',
            ),
          );
        } else {
          // ignore: avoid_print
          print('it is wrong');
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
              semanticLabel: 'cross - X - icon as false',
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${quizBrain.getTheNumberOfQuestion()}) ${quizBrain.getQuestionText()}',
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
            checkAnswer(true);

            setState(
              () {
                quizBrain.nextNumberOfQuestion();
                quizBrain.nextQuestionNumber();
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
            checkAnswer(false);
            setState(
              () {
                quizBrain.nextNumberOfQuestion();
                quizBrain.nextQuestionNumber();
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
          children: scoreKeeper,
        )
      ],
    );
  }
}
