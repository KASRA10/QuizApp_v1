import 'package:flutter/material.dart';

void main() => runApp(const Quizzler());

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
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'This is where the question text will go.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 21.0,
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
            setState(
              () {
                scoreKeeper.add(
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                    semanticLabel: 'Check/ Ok Icon Indicates True',
                  ),
                );
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
            setState(
              () {
                scoreKeeper.add(
                  const Icon(
                    Icons.close,
                    color: Colors.red,
                    semanticLabel: 'Check/ Ok Icon Indicates True',
                  ),
                );
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
