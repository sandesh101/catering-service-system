import 'package:flutter/material.dart';

class RadioProvider extends ChangeNotifier {
  int? _groupValue;

  int? get groupValue => _groupValue;

  handleRadio(int? value) {
    _groupValue = value!;
    print("VAL: $_groupValue");
    notifyListeners();
  }
}
