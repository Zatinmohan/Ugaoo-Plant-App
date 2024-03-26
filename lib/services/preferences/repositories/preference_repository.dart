import 'package:ugaoo/user/user_model.dart';

abstract class PreferencesRepo {
  Future<bool> clearPreferences();
  Future<bool> setStringData({
    required String key,
    required String value,
  });

  Future<bool> setListData({
    required String key,
    required List<String> value,
  });

  Future<bool> setInt({
    required String key,
    required int value,
  });

  Future<bool> setBoolData({
    required String key,
    required bool value,
  });

  Future<bool> setDoubleData({
    required String key,
    required double value,
  });

  bool exist({required String key});

  Future<List<String>> getStringList({
    required String key,
    List<String>? defaultValue,
  });

  Future<String> getString({
    required String key,
    String? defaultValue,
  });

  Future<bool> getBool({
    required String key,
    bool? defaultValue,
  });

  Future<int> getInt({
    required String key,
    int? defaultValue,
  });

  Future<double> getDouble({
    required String key,
    double? defaultValue,
  });

  Future<bool> setUserAfterLogin({required UserModel user});

  Future<bool> clearUserDataAfterLogout();
}
