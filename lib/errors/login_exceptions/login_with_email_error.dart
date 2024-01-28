import 'package:ugaoo/errors/base_exception.dart';

class LoginWithEmailPasswordException extends BaseException {
  LoginWithEmailPasswordException([super.message]);
  factory LoginWithEmailPasswordException.fromCode({required String code}) {
    switch (code) {
      case 'invalid-email':
        return LoginWithEmailPasswordException(
          'Please enter a valid email',
        );

      case 'user-disabled':
        return LoginWithEmailPasswordException(
          'This user has been disabled. Please contact support',
        );

      case 'user-not-found':
        return LoginWithEmailPasswordException(
          'Email or password is incorrect. Try again',
        );

      case 'wrong-password':
        return LoginWithEmailPasswordException(
          'Incorrect Email or password. Try again',
        );

      default:
        return LoginWithEmailPasswordException();
    }
  }
}
