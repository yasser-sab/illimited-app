import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier{

  bool _isAuthenticating = false;

  bool get isAuthenticating => _isAuthenticating;

  setIsAuthenticating(bool value){
    _isAuthenticating = value;
    notifyListeners();
  }
}