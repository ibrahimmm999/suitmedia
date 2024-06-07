import 'package:flutter/material.dart';

class NameProvider extends ChangeNotifier {
  String _name = "";
  String get name => _name;
  void setUser(String name) {
    _name = name;
    notifyListeners();
  }
}
