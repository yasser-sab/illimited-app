import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  //VERIFICATION COOL DOWN
  int _sendVerificationCooldown = 0;
  Timer? _cooldownTimer;

  int get sendVerificationCooldown => _sendVerificationCooldown;

  void startCooldown(int cooldownDuration) {
    _sendVerificationCooldown = cooldownDuration;

    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_sendVerificationCooldown > 0) {
        _sendVerificationCooldown--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });

    notifyListeners();
  }

  void resetCooldown() {
    _sendVerificationCooldown = 0;
    _cooldownTimer?.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    super.dispose();
  }

  //IS FIRST LAUNCH
  bool _isFirstLunch = true;
  bool get isFirstLunch => _isFirstLunch;
  void setFirstLaunch(bool val) async {
    _isFirstLunch = val;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstLaunch', val);
    notifyListeners();
  }
}
