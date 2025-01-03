import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  int _theNumberOfQuestion = 1;
  bool _isFinishedStatus = false;

  final List<Questions> _questionBank = [
    Questions('Some cats are actually allergic to humans', true),
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions(
        'Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true),
    Questions('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Questions('It is illegal to pee in the Ocean in Portugal.', true),
    Questions(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Questions(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Questions(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Questions(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Questions('Google was originally called "Backrub".', true),
    Questions(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Questions(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQuestionNumber() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else if (_questionNumber == _questionBank.length - 1) {
      _isFinishedStatus = true;
    }
    // ignore: avoid_print
    print(_questionNumber);
    // ignore: avoid_print
    print(_questionBank.length);
  }

  void nextNumberOfQuestion() {
    if (_theNumberOfQuestion < _questionBank.length - 1) {
      _theNumberOfQuestion++;
    }
  }

  // Reset Method
  void resetAll() {
    _questionNumber = -1;
    _theNumberOfQuestion = 0;
    _isFinishedStatus = false;
  }

  // Create A Method To Check If We Are At The End Of The Question Lists Or Not
  bool isFinished() {
    if (_isFinishedStatus == true) {
      return true;
    } else {
      return false;
    }
  }

  // Create Getter For Our Private(Encapsulation) Fields
  String getQuestionText() => _questionBank[_questionNumber].questionText;

  bool getQuestionAnswer() => _questionBank[_questionNumber].questionAnswer;

  int getTheNumberOfQuestion() => _theNumberOfQuestion;
}
