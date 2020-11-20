import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  bool _isBusy = false;
  bool get isBusy => _isBusy;

  setBusy(bool busy) {
    _isBusy = busy;
    notifyListeners();
  }
}
