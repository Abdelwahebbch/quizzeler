import 'Question.dart';

class QuestionsBrain {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question(
      question: 'Some cats are actually allergic to humans',
      reponse: true,
    ),
    Question(
      question: 'You can lead a cow down stairs but not up stairs.',
      reponse: false,
    ),
    Question(
      question: 'Approximately one quarter of human bones are in the feet.',
      reponse: true,
    ),
    Question(question: 'A slug\'s blood is green.', reponse: true),
    Question(
      question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
      reponse: true,
    ),
    Question(
      question: 'It is illegal to pee in the Ocean in Portugal.',
      reponse: true,
    ),
    Question(
      question:
          'No piece of square dry paper can be folded in half more than 7 times.',
      reponse: false,
    ),
    Question(
      question:
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      reponse: true,
    ),
    Question(
      question:
          'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      reponse: false,
    ),
    Question(
      question:
          'The total surface area of two human lungs is approximately 70 square metres.',
      reponse: true,
    ),
    Question(
      question: 'Google was originally called \"Backrub\".',
      reponse: true,
    ),
    Question(
      question:
          'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      reponse: true,
    ),
    Question(
      question:
          'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      reponse: true,
    ),
  ];

  void NextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questions[_questionNumber].question;
  }

  bool getQuestionResponse() {
    return this._questions[_questionNumber].reponse;
  }
}
