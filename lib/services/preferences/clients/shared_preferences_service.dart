import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugaoo/errors/shared_preference_exception.dart';
import 'package:ugaoo/services/preferences/pref_keys.dart';
import 'package:ugaoo/services/preferences/repositories/preference_repository.dart';
import 'package:ugaoo/user/user_model.dart';

const String _logName = "Shared Preference Service";

class SharedPreferenceService extends PreferencesRepo {
  late final SharedPreferences? _preference;

  SharedPreferenceService() {
    _initService();
    log("Shared Preference Service Started", name: _logName);
  }

  Future<void> _initService() async {
    _preference = await SharedPreferences.getInstance();
  }

  @override
  Future<void> clearPreferences() async {
    try {
      await _preference?.clear();
    } catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    }
  }

  @override
  Future<void> setStringData({
    required String key,
    required String value,
  }) async {
    try {
      await _preference?.setString(key, value);
    } catch (e) {
      throw SharedPreferenceException.fromCode(error: e.toString());
    }
  }

  @override
  Future<void> setListData({
    required String key,
    required List<String> value,
  }) async {
    try {
      await _preference?.setStringList(key, value);
    } catch (e) {
      throw SharedPreferenceException.fromCode(error: e.toString());
    }
  }

  @override
  Future<void> setBoolData({
    required String key,
    required bool value,
  }) async {
    try {
      await _preference?.setBool(key, value);
    } catch (e) {
      throw SharedPreferenceException.fromCode(error: e.toString());
    }
  }

  @override
  Future<void> setDoubleData({
    required String key,
    required double value,
  }) async {
    try {
      await _preference?.setDouble(key, value);
    } catch (e) {
      throw SharedPreferenceException.fromCode(error: e.toString());
    }
  }

  @override
  bool exist({required String key}) {
    return _preference?.containsKey(key) ?? false;
  }

  @override
  Future<String> getString({
    required String key,
    String? defaultValue,
  }) async {
    try {
      String? _temp;

      _temp = await _preference?.getString(key);
      if (_temp == null && defaultValue != null) {
        await _preference?.setString(key, defaultValue);
      } else if (_temp == null && defaultValue == null) {
        throw SharedPreferenceException.fromCode(
          error: "Please add some default value",
        );
      }
      return _temp!;
    } catch (e) {
      throw SharedPreferenceException.fromCode(error: e.toString());
    }
  }

  @override
  Future<List<String>> getStringList({
    required String key,
    List<String>? defaultValue,
  }) async {
    try {
      List<String>? _temp;
      _temp = await _preference?.getStringList(key);

      if (_temp == null && defaultValue != null) {
        await _preference?.setStringList(key, defaultValue);
      } else if (_temp == null && defaultValue == null) {
        throw SharedPreferenceException.fromCode(
          error: "Please add some default value",
        );
      }
      return _temp!;
    } catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    }
  }

  @override
  Future<bool> getBool({
    required String key,
    bool? defaultValue,
  }) async {
    try {
      bool? _temp;
      _temp = await _preference?.getBool(key);

      if (_temp == null && defaultValue != null) {
        await _preference?.setBool(key, defaultValue);
      } else if (_temp == null && defaultValue == null) {
        throw SharedPreferenceException.fromCode(
          error: "Please add some default value",
        );
      }
      return _temp!;
    } catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    }
  }

  @override
  Future<int> getInt({
    required String key,
    int? defaultValue,
  }) async {
    try {
      int? _temp;
      _temp = await _preference?.getInt(key);

      if (_temp == null && defaultValue != null) {
        await _preference?.setInt(key, defaultValue);
      } else if (_temp == null && defaultValue == null) {
        throw SharedPreferenceException.fromCode(
          error: "Please add some default value",
        );
      }
      return _temp!;
    } catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    }
  }

  @override
  Future<double> getDouble({
    required String key,
    double? defaultValue,
  }) async {
    try {
      double? _temp;
      _temp = await _preference?.getDouble(key);

      if (_temp == null && defaultValue != null) {
        await _preference?.setDouble(key, defaultValue);
      } else if (_temp == null && defaultValue == null) {
        throw SharedPreferenceException.fromCode(
          error: "Please add some default value",
        );
      }
      return _temp!;
    } catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    }
  }

  @override
  Future<void> setUserAfterLogin({required UserModel user}) async {
    await _preference?.setString(
      PreferenceKeys.LOGINTOKEN.name,
      user.loginToken,
    );
    await _preference?.setString(PreferenceKeys.FIRSTNAME.name, user.firstName);
    await _preference?.setString(PreferenceKeys.LASTNAME.name, user.lastName);
    await _preference?.setBool(
      PreferenceKeys.ISLOGIN.name,
      user.isLoginSuccessful,
    );
    await _preference?.setString(PreferenceKeys.LOGINTYPE.name, user.loginType);
  }

  @override
  Future<void> clearUserDataAfterLogout() async {
    await _preference?.setBool(PreferenceKeys.ISLOGIN.name, false);
    await _preference?.setString(PreferenceKeys.FIRSTNAME.name, "");
    await _preference?.setString(PreferenceKeys.LASTNAME.name, "");
    await _preference?.setString(PreferenceKeys.LOGINTOKEN.name, "");
    await _preference?.setString(PreferenceKeys.LOGINTYPE.name, "");
  }
}
