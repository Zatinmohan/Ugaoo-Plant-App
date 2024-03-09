import 'dart:developer';

import 'package:flutter/material.dart';

const String _logName = "Address Provider";

class AddressPageProvider extends ChangeNotifier {
  int _selectedAddressIndex = 0;

  AddressPageProvider() {
    log("Address Provider Activated", name: _logName);
  }

  int get selectedAddressIndex => _selectedAddressIndex;

  void onAddressSelected(int index) {
    _selectedAddressIndex = index;
    notifyListeners();
  }
}
