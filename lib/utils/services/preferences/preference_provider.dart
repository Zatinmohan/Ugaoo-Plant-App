import 'package:flutter/material.dart';
import 'package:ugaoo/utils/services/preferences/repositories/preference_repository.dart';

class PreferenceProvider extends ChangeNotifier {
  final PreferencesRepo _preferenceService;

  PreferenceProvider({required PreferencesRepo service})
      : _preferenceService = service;

  PreferencesRepo get preference => _preferenceService;
}
