import 'package:flutter/material.dart';
import 'package:ugaoo/utils/services/preferences/pref_keys.dart';
import 'package:ugaoo/utils/services/preferences/repositories/preference_repository.dart';

class PreferenceProvider extends ChangeNotifier {
  final PreferencesRepo _preferenceService;

  PreferenceProvider({required PreferencesRepo service})
      : _preferenceService = service;

  PreferencesRepo get preference => _preferenceService;

  void setLoginPreferences() {
    _preferenceService.setBoolData(
      key: PreferenceKeys.ISLOGIN.name,
      value: true,
    );
    // notifyListeners();
  }
}
