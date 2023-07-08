import 'package:flutter/material.dart';

class ImagePickerProvider extends ChangeNotifier {
  bool _isPickedImage = false;

  bool get isPickedImage => _isPickedImage;

  setIsPickedImage(bool value) {
    _isPickedImage = value;
    notifyListeners();
  }
}
