import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugaoo/routes/clients/go_router_service.dart';
import 'package:ugaoo/routes/routes_provider.dart';
import 'package:ugaoo/services/api/api_provider.dart';
import 'package:ugaoo/services/api/clients/dio_http_client.dart';
import 'package:ugaoo/services/auth/clients/firebaes_login_services.dart';
import 'package:ugaoo/services/auth/login_provider.dart';
import 'package:ugaoo/services/preferences/preference_provider.dart';
import 'package:ugaoo/services/preferences/clients/shared_preferences_service.dart';
import 'package:ugaoo/user/user_model.dart';

class GlobalDependencyInjection {
  static final Provider<UserModel> userDetail = Provider<UserModel>((ref) {
    return const UserModel();
  });

  static final FutureProvider<PreferenceProvider> preferenceProvider =
      FutureProvider<PreferenceProvider>((ref) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return PreferenceProvider(
      service: SharedPreferenceService(
        pref: pref,
      ),
    );
  });

  static final Provider<LoginProvider> loginProvider = Provider<LoginProvider>(
    (ref) => LoginProvider(
      service: LoginServiceWithFirebase(
        auth: FirebaseAuth.instance,
        preference: ref.read(preferenceProvider).value!.preference,
      ),
    ),
  );
  static final routerProvider = Provider<RoutesProvider<GoRouter>>((ref) {
    return RoutesProvider(
      routesService: GoRouterService(
        navigationKey: GlobalKey<NavigatorState>(),
        loginService: ref.watch(loginProvider).loginService,
      ),
    );
  });

  static final Provider<ApiProvider> apiProvider = Provider<ApiProvider>((ref) {
    return ApiProvider(
      networkService: DioClient(),
    );
  });
}
