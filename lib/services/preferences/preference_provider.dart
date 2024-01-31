import 'package:ugaoo/services/preferences/repositories/preference_repository.dart';

class PreferenceProvider {
  final PreferencesRepo _preferenceService;

  PreferenceProvider({required PreferencesRepo service})
      : _preferenceService = service;

  PreferencesRepo get preference => _preferenceService;
}
