import 'dart:async';
import 'package:flutter/material.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {



  bool _isProccessingPurchase = false;
  bool get isProccessingPurchase => _isProccessingPurchase;
  void setProccessingPurchase(bool val) async {
    _isProccessingPurchase = val;
    notifyListeners();
  }

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

//SCREEN WIDTH & HEIGHT
  double _screenWidth = 390;
  double get screenWidth => _screenWidth;
  void setScreenWidth(BuildContext context) async {
    _screenWidth = getScreenWidth(context);
  }

  double _screenHeight = 810;
  double get screenHeight => _screenHeight;
  void setScreenHeight(BuildContext context) async {
    _screenHeight = getScreenHeight(context);
  }
}
