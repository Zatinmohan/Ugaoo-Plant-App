import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugaoo/errors/shared_preference_exception.dart';
import 'package:ugaoo/utils/services/preferences/repositories/preference_repository.dart';

const String _logName = "Shared Preference Service";

class SharedPreferenceService extends PreferencesRepo {
  final SharedPreferences? _preference;

  SharedPreferenceService({
    required SharedPreferences sharedPreferences,
  }) : _preference = sharedPreferences {
    log("Shared Preference Service Started", name: _logName);
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
}
