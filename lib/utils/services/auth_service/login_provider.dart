import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:ugaoo/utils/services/auth_service/constants/login_states.dart';
import 'package:ugaoo/utils/services/auth_service/repositories/auth_types_services.dart';

const String _logName = "Login Provider";

class LoginProvider extends ChangeNotifier {
  final LoginServiceRepo _authService;

  LoginProvider({
    required LoginServiceRepo service,
  }) : _authService = service;

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
        await _authService.loginViaGoogle();
        break;

      case LoginType.SIGNOUT:
        await _authService.logout();
        break;

      default:
        break;
    }
  }

  @override
  void dispose() {
    log("Login Provider Disposed", name: _logName);
    super.dispose();
  }
}
