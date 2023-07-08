import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isPassword = false;
  bool _isConfirmPassword = false;

  bool get isLoading => _isLoading;
  bool get isPassword => _isPassword;
  bool get isConfirmPassword => _isConfirmPassword;

  setIsLoading(bool loadingValue) {
    _isLoading = loadingValue;
    notifyListeners();
  }

  setIsPassword() {
    _isPassword = !_isPassword;
    notifyListeners();
  }

  setIsConfirmPassword() {
    _isConfirmPassword = !_isConfirmPassword;
    notifyListeners();
  }
}
