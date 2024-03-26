import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugaoo/errors/shared_preference_exception.dart';
import 'package:ugaoo/services/preferences/pref_keys.dart';
import 'package:ugaoo/services/preferences/repositories/preference_repository.dart';
import 'package:ugaoo/user/user_model.dart';

const String _logName = "Shared Preference Service";

class SharedPreferenceService extends PreferencesRepo {
  final SharedPreferences _preference;

  SharedPreferenceService({required SharedPreferences pref})
      : _preference = pref {
    log("Shared Preferences Service Started", name: _logName);
  }

  @override
  Future<bool> clearPreferences() async {
    try {
      await _preference.clear();
      return true;
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.message);
    } catch (error) {
      throw const SharedPreferenceException();
    }
  }

  @override
  Future<bool> setInt({required String key, required int value}) async {
    try {
      return await _preference.setInt(key, value);
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }

  @override
  Future<bool> setStringData({
    required String key,
    required String value,
  }) async {
    try {
      return await _preference.setString(key, value);
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }

  @override
  Future<bool> setListData({
    required String key,
    required List<String> value,
  }) async {
    try {
      return await _preference.setStringList(key, value);
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }

  @override
  Future<bool> setBoolData({
    required String key,
    required bool value,
  }) async {
    try {
      return await _preference.setBool(key, value);
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }

  @override
  Future<bool> setDoubleData({
    required String key,
    required double value,
  }) async {
    try {
      return await _preference.setDouble(key, value);
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }

  @override
  bool exist({required String key}) {
    return _preference.containsKey(key);
  }

  @override
  Future<String> getString({
    required String key,
    String? defaultValue,
  }) async {
    try {
      String? _temp;

      _temp = _preference.getString(key);
      if (_temp == null && defaultValue != null) {
        await _preference.setString(key, defaultValue);
        return defaultValue;
      } else if (_temp == null && defaultValue == null) {
        throw SharedPreferenceException.fromCode(
          error: "Please add some default value",
        );
      }
      return _temp!;
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }

  @override
  Future<List<String>> getStringList({
    required String key,
    List<String>? defaultValue,
  }) async {
    try {
      List<String>? _temp;
      _temp = _preference.getStringList(key);

      if (_temp == null && defaultValue != null) {
        await _preference.setStringList(key, defaultValue);
        return defaultValue;
      } else if (_temp == null && defaultValue == null) {
        throw SharedPreferenceException.fromCode(
          error: "Please add some default value",
        );
      }
      return _temp!;
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }

  @override
  Future<bool> getBool({
    required String key,
    bool? defaultValue,
  }) async {
    try {
      bool? _temp;
      _temp = await _preference.getBool(key);

      if (_temp == null && defaultValue != null) {
        await _preference.setBool(key, defaultValue);
        return defaultValue;
      } else if (_temp == null && defaultValue == null) {
        throw SharedPreferenceException.fromCode(
          error: "Please add some default value",
        );
      }
      return _temp!;
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }

  @override
  Future<int> getInt({
    required String key,
    int? defaultValue,
  }) async {
    try {
      int? _temp;
      _temp = _preference.getInt(key);

      if (_temp == null && defaultValue != null) {
        await _preference.setInt(key, defaultValue);
        return defaultValue;
      } else if (_temp == null && defaultValue == null) {
        throw SharedPreferenceException.fromCode(
          error: "Please add some default value",
        );
      }

      return _temp!;
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }

  @override
  Future<double> getDouble({
    required String key,
    double? defaultValue,
  }) async {
    try {
      double? _temp;
      _temp = _preference.getDouble(key);

      if (_temp == null && defaultValue != null) {
        await _preference.setDouble(key, defaultValue);
      } else if (_temp == null && defaultValue == null) {
        throw SharedPreferenceException.fromCode(
          error: "Please add some default value",
        );
      }
      return _temp!;
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }

  @override
  Future<bool> setUserAfterLogin({required UserModel user}) async {
    try {
      await _preference.setString(
        PreferenceKeys.LOGINTOKEN.name,
        user.loginToken,
      );
      await _preference.setString(
        PreferenceKeys.FIRSTNAME.name,
        user.userName.split(' ')[0],
      );
      await _preference.setString(
        PreferenceKeys.LASTNAME.name,
        user.userName.split(' ')[1],
      );
      await _preference.setBool(
        PreferenceKeys.ISLOGIN.name,
        user.isLoginSuccessful,
      );

      await _preference.setString(PreferenceKeys.EMAIL.name, user.userEmail);
      await _preference.setString(
        PreferenceKeys.LOGINTYPE.name,
        user.loginType,
      );
      await _preference.setString(
        PreferenceKeys.LOGINTOKEN.name,
        user.loginToken,
      );
      await _preference.setString(
        PreferenceKeys.PROFILEIMAGE.name,
        user.profileImage,
      );
      return true;
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }

  @override
  Future<bool> clearUserDataAfterLogout() async {
    try {
      await _preference.setBool(PreferenceKeys.ISLOGIN.name, false);
      await _preference.setString(PreferenceKeys.FIRSTNAME.name, "");
      await _preference.setString(PreferenceKeys.LASTNAME.name, "");
      await _preference.setString(PreferenceKeys.LOGINTOKEN.name, "");
      await _preference.setString(PreferenceKeys.LOGINTYPE.name, "");
      await _preference.setString(PreferenceKeys.PROFILEIMAGE.name, "");
      return true;
    } on SharedPreferenceException catch (error) {
      throw SharedPreferenceException.fromCode(error: error.toString());
    } catch (e) {
      throw const SharedPreferenceException();
    }
  }
}
