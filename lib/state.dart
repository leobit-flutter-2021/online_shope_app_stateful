import 'package:flutter/material.dart';

class ColorModeState extends ChangeNotifier {
  bool _darkMode = false;

  void changeColorMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }

  Color getBackgrundColor() {
    if (_darkMode) {
      return Colors.black87;
    } else {
      return Colors.white;
    }
  }

  Color getItemColor() {
    if (_darkMode) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color getButtonColor() {
    if (_darkMode) {
      return Colors.amberAccent.shade700;
    } else {
      return Colors.black;
    }
  }

  bool darkModeState() {
    return _darkMode;
  }
}
