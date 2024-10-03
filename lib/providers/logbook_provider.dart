import 'package:flutter/material.dart';
import 'package:illimited_app/data/questions.dart';

class LogbookProvider extends ChangeNotifier {
  List<String> _answers = [];
  // int _moodAnswer = -1;
  // int get moodAnswer => _moodAnswer;

  // void setMoodAnswer(int index) {
  //   _moodAnswer = index;
  //   notifyListeners();
  // }

  bool _isAllAnswered = false;
  List<String> get answers => _answers;
  bool get isAllAnswered => _isAllAnswered;

  void setAnswerAt(String answer, int index) {
    _answers[index] = answer;
    if (_answers.every((str) => str != "")) {
      _isAllAnswered = true;
    } else {
      _isAllAnswered = false;
    }
    notifyListeners();
  }

  void initializeAnswers(int lenght) {
    _answers = List.filled(lenght, "");
    _isAllAnswered = false;
    // _currentPage = 0;
  }

  void resetProvider() {
    _answers = List.filled(questions.length, "");
    _isAllAnswered = false;
  }
}
