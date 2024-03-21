import 'package:ugaoo/services/preferences/pref_keys.dart';
import 'package:ugaoo/services/preferences/repositories/preference_repository.dart';
import 'package:ugaoo/user/user_model.dart';

class PreferenceProvider {
  final PreferencesRepo _preferenceService;

  PreferenceProvider({
    required PreferencesRepo service,
  }) : _preferenceService = service;

  PreferencesRepo get preference => _preferenceService;

  Future<UserModel> getUserData() async {
    try {
      final UserModel data = UserModel(
        firstName: await _preferenceService.getString(
          key: PreferenceKeys.FIRSTNAME.name,
        ),
        lastName: await _preferenceService.getString(
          key: PreferenceKeys.LASTNAME.name,
        ),
        isLoginSuccessful: await _preferenceService.getBool(
          key: PreferenceKeys.ISLOGIN.name,
        ),
        userEmail: await _preferenceService.getString(
          key: PreferenceKeys.EMAIL.name,
        ),
        loginToken: await _preferenceService.getString(
          key: PreferenceKeys.LOGINTOKEN.name,
        ),
        loginType: await _preferenceService.getString(
          key: PreferenceKeys.LOGINTYPE.name,
        ),
      );

      return data;
    } catch (error) {
      rethrow;
    }
  }
}
