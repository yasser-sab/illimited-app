import 'package:flutter/material.dart';
import 'package:illimited_app/models/user.dart';

class UserProvider extends ChangeNotifier {
  String _userId = "";
  bool _isQuestionsAnswered = false;

  // Users? _user;

  String get userId => _userId;
  bool get isQuestionsAnswered => _isQuestionsAnswered;

  void setUserId(String id) {
    _userId = id;

    notifyListeners();
  }

  void setQuestionFlag(bool isQuestionsAnswered) {
    _isQuestionsAnswered = isQuestionsAnswered;

    notifyListeners();
  }
}
