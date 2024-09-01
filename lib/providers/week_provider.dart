import 'package:flutter/material.dart';
import 'package:illimited_app/data/questions.dart';

class WeekProvider extends ChangeNotifier {
  double _percentage = 0;

  double get percentage => _percentage;

  void setPercentage(double val) {
    _percentage = val;
    notifyListeners();
  }

  void resetProvider(){
    _percentage = 0;
  }
}
