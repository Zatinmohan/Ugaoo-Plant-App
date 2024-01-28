import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugaoo/utils/services/api_provider/api_provider.dart';
import 'package:ugaoo/utils/services/api_provider/clients/dio_http_client.dart';
import 'package:ugaoo/utils/services/auth_service/clients/firebaes_login_services.dart';
import 'package:ugaoo/utils/services/auth_service/login_provider.dart';
import 'package:ugaoo/utils/services/preferences/preference_provider.dart';
import 'package:ugaoo/utils/services/preferences/clients/preferences.dart';

class GlobalDependencyInjection {
  static final FutureProvider<PreferenceProvider> preferenceProvider =
      FutureProvider<PreferenceProvider>((ref) async {
    return PreferenceProvider(
      service: SharedPreferenceService(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
    );
  });

  static final AutoDisposeProvider<LoginProvider> loginProvider =
      Provider.autoDispose<LoginProvider>(
    (ref) => LoginProvider(
      service: LoginServiceWithFirebase(auth: FirebaseAuth.instance),
    ),
  );

  static final Provider<ApiProvider> apiProvider = Provider<ApiProvider>((ref) {
    return ApiProvider(
      networkService: DioClient(),
    );
  });
}
