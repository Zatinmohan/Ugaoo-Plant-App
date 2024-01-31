import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index;

  BottomNavigationProvider({int? index}) : _index = index ?? 0;

  void onTap(int index) {
    _index = index;
    notifyListeners();
  }

  int get index => _index;
}
