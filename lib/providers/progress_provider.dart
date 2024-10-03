import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:illimited_app/data/questions.dart';

class UserProgressProvider extends ChangeNotifier {
  DocumentReference? _currentDayRef;
  DocumentReference? get currentDayRef => _currentDayRef;

  void setCurrentDayRef(DocumentReference? val) {
    _currentDayRef = val;
  }

  DocumentReference? _currentWeekRef;
  DocumentReference? get currentWeekRef => _currentWeekRef;

  void setCurrentWeekRef(DocumentReference? val) {
    _currentWeekRef = val;
  }

  double _percentage = 0;

  double get percentage => _percentage;

  void setPercentage(double val) {
    _percentage = val;
    notifyListeners();
  }

  void resetProvider() {
    _percentage = 0;
    _currentWeekRef = null;
    _currentDayRef = null;
  }
}
