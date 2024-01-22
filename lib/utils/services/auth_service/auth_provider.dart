import 'package:flutter/material.dart';
import 'package:ugaoo/utils/services/auth_service/auth_firebaes_service.dart';
import 'package:ugaoo/utils/services/auth_service/constants/login_states.dart';

class AuthProvider extends ChangeNotifier {
  final AuthServiceWithFirebase _authService;

  AuthProvider({required AuthServiceWithFirebase service})
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

      case LoginStates.SIGNOUT:
        await _authService.logout();
        break;

      default:
        break;
    }
  }
}