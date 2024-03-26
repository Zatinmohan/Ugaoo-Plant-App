import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ugaoo/services/auth/constants/login_states.dart';
import 'package:ugaoo/services/auth/repositories/auth_types_services.dart';

const String _logName = "Login Provider";

class LoginProvider {
  final LoginServiceRepo _authService;

  LoginProvider({
    required LoginServiceRepo service,
  }) : _authService = service {
    log("Login Provider Init", name: _logName);
  }

  Future<bool> login({
    required LoginType status,
    String? email,
    String? password,
  }) async {
    try {
      switch (status) {
        case LoginType.EMAIL:
          assert(email != null || email!.isNotEmpty);
          assert(password != null || password!.isNotEmpty);
          bool response = await _authService.loginWithEmailAndPassword(
            email: email!,
            password: password!,
          );
          return response;

        case LoginType.GOOGLE:
          bool response = await _authService.loginViaGoogle();
          return response;

        case LoginType.SIGNOUT:
          return await _authService.logout();

        default:
          return false;
      }
    } catch (error) {
      rethrow;
    }
  }

  LoginServiceRepo get loginService => _authService;

  Future<void> signOut() async {
    try {
      await _authService.logout();
    } catch (error) {
      throw error;
    }
  }
}
