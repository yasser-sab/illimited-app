import 'package:flutter/material.dart';
import 'package:illimited_app/data/questions.dart';

class QuestionProvider extends ChangeNotifier{
  List<String> _answers = List.filled(questions.length, "");
  
  List<String> get answers => _answers;

  void setAnswerAt(String answer, int index)
  {
    _answers[index] = answer;
    notifyListeners();
    
  }
}
