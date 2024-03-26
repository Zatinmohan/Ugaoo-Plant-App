import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugaoo/errors/shared_preference_exception.dart';
import 'package:ugaoo/services/preferences/clients/shared_preferences_service.dart';

import 'shared_preference_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late SharedPreferenceService sharedPreferenceService;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    sharedPreferenceService =
        SharedPreferenceService(pref: mockSharedPreferences);
  });

  group("Shared Preference Test", () {
    test("Shared Prefrence Cleared", () async {
      when(mockSharedPreferences.clear()).thenAnswer((_) => Future.value(true));
      final bool result = await sharedPreferenceService.clearPreferences();

      expect(result, isTrue);
      verify(mockSharedPreferences.clear()).called(1);
    });

    test("Set Int - Success", () async {
      const String key = "key";
      const int value = 1;

      when(mockSharedPreferences.setInt(key, value)).thenAnswer(
        (realInvocation) => Future.value(true),
      );

      final result =
          await sharedPreferenceService.setInt(key: key, value: value);

      expect(result, isTrue);
      verify(mockSharedPreferences.setInt(key, value)).called(1);
    });

    test("Set String - Success", () async {
      const String key = "key";
      const String value = "1";

      when(mockSharedPreferences.setString(key, value)).thenAnswer(
        (realInvocation) => Future.value(true),
      );

      final result =
          await sharedPreferenceService.setStringData(key: key, value: value);

      expect(result, isTrue);
      verify(
        await mockSharedPreferences.setString(key, value),
      ).called(1);
    });

    test("Contains Key - Success", () {
      const String key = "key";
      when(mockSharedPreferences.containsKey(key)).thenReturn(true);
      final result = sharedPreferenceService.exist(key: key);

      expect(result, isTrue);
      verify(mockSharedPreferences.containsKey(key)).called(1);
    });

    test("Get integer value - Success", () async {
      const String key = "key";
      const int value = 1;
      when(mockSharedPreferences.getInt(key)).thenAnswer((_) => value);
      final result = await sharedPreferenceService.getInt(key: key);

      expect(result, equals(value));
      verify(mockSharedPreferences.getInt(key)).called(1);
    });

    test("Get String Value - Error", () async {
      const String key = "Key";
      const String error = "Something whent wrong";

      when(mockSharedPreferences.getString(key))
          .thenThrow(SharedPreferenceException.fromCode(error: error));

      final result = sharedPreferenceService.getString(key: key);

      expect(result, throwsA(SharedPreferenceException.fromCode(error: error)));
      verify(await mockSharedPreferences.getString(key)).called(1);
    });
    
    test("Get List<String> Value - Error", () async {
      const String key = "Key";
      const String error = "Something whent wrong";

      when(mockSharedPreferences.getStringList(key))
          .thenThrow(SharedPreferenceException.fromCode(error: error));

      final result = sharedPreferenceService.getStringList(key: key);

      expect(result, throwsA(SharedPreferenceException.fromCode(error: error)));
      verify(await mockSharedPreferences.getStringList(key)).called(1);
    });
  });
}
