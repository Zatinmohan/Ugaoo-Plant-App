import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/dependency_injection/global_dependency_injections.dart';
import 'package:ugaoo/services/auth/constants/login_states.dart';
import 'package:ugaoo/services/auth/repositories/auth_types_services.dart';

const String _logName = "Login Provider";

class LoginProvider extends ChangeNotifier {
  final LoginServiceRepo _authService;
  final Ref _ref;

  LoginProvider({
    required LoginServiceRepo service,
    required Ref ref,
  })  : _authService = service,
        _ref = ref;

  Future<void> login({
    required LoginType status,
    String? email,
    String? password,
  }) async {
    switch (status) {
      case LoginType.EMAIL:
        await _authService.loginWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        break;

      case LoginType.GOOGLE:
        try {
          await _authService.loginViaGoogle();
          setLoginPreferences();
        } catch (error) {
          rethrow;
        }

        break;

      case LoginType.SIGNOUT:
        await _authService.logout();
        break;

      default:
        break;
    }
  }

  void setLoginPreferences() {
    _ref.read(GlobalDependencyInjection.preferenceProvider).whenData((value) {
      value.setLoginPreferences();
    });
  }

  @override
  void dispose() {
    log("Login Provider Disposed", name: _logName);
    super.dispose();
  }
}
