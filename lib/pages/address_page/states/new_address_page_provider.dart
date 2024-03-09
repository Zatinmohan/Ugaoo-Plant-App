import 'package:flutter/material.dart';

enum HOME_TYPE { HOME, OFFICE, OTHER }

class NewAddressPageProvider extends ChangeNotifier {
  HOME_TYPE homeType = HOME_TYPE.HOME;

  NewAddressPageProvider();

  void changeHomeType({required HOME_TYPE type}) {
    homeType = type;
    notifyListeners();
  }
}
