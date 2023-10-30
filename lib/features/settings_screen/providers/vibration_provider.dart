import 'package:flutter/material.dart';

class VibrationProvider extends ChangeNotifier {
  bool isVibrationOn = true;

  void turnOnVibration() {
    isVibrationOn = true;
    notifyListeners();
  }

  void turnOffVibration() {
    isVibrationOn = false;
    notifyListeners();
  }
}
