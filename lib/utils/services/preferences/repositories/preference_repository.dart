abstract class PreferencesRepo {
  Future<void> clearPreferences();
  Future<void> setStringData({
    required String key,
    required String value,
  });

  Future<void> setListData({
    required String key,
    required List<String> value,
  });

  Future<void> setBoolData({
    required String key,
    required bool value,
  });

  Future<void> setDoubleData({
    required String key,
    required double value,
  });

  bool exist({required String key});

  Future<List<String>> getStringList({
    required String key,
    List<String>? defaultValue,
  });

  Future<List<String>> getBool({
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
}
