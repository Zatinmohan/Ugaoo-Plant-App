import 'package:ugaoo/utils/errors/base_exception.dart';

class FirebaseAuthExceptions extends BaseException {
  const FirebaseAuthExceptions([super.message]);

  factory FirebaseAuthExceptions.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const FirebaseAuthExceptions("Account already exist");

      case 'invalid-credential:':
        return const FirebaseAuthExceptions(
          'Account Credentails are invalid. Please try again',
        );

      case 'operation-not-allowed':
        return const FirebaseAuthExceptions(
          'Your account is blocked or invalid. Try again later',
        );

      case 'user-disabled':
        return const FirebaseAuthExceptions(
          'Your account is blocked or invalid. Try again later',
        );

      default:
        return const FirebaseAuthExceptions();
    }
  }
}
