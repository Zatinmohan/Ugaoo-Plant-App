import 'package:flutter/material.dart';
import 'package:ugaoo/utils/services/auth_service/auth_firebase_service.dart';
import 'package:ugaoo/utils/services/auth_service/constants/login_states.dart';

class AuthenticationProvider extends ChangeNotifier {
  final AuthServiceWithFirebase _authService;

  AuthenticationProvider({required AuthServiceWithFirebase service})
      : _authService = service;

  Future<void> login(
      {required LoginStates status, String? email, String? password}) async {
    switch (status) {
      case LoginStates.EMAIL:
        await _authService.loginWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        
        break;

      case LoginStates.GOOGLE:
        await _authService.loginViaGoogle();
        break;

      case LoginStates.SIGNOUT:
        await _authService.logout();
        break;

      default:
        break;
    }
  }
}
