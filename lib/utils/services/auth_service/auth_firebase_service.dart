import 'package:firebase_auth/firebase_auth.dart';
import 'package:ugaoo/utils/errors/login_exceptions/login_with_email_error.dart';
import 'package:ugaoo/utils/services/auth_service/repositories/auth_types_services.dart';

class AuthServiceWithFirebase implements AuthServicesRepo {
  FirebaseAuth _auth;

  AuthServiceWithFirebase({required FirebaseAuth? auth})
      : _auth = auth ?? FirebaseAuth.instance;

  @override
  Future<void> loginViaGoogle() async {}

  @override
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential _credentails =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _credentails;
    } on FirebaseAuthException catch (error) {
      throw LoginWithEmailPasswordException.fromCode(code: error.code);
    } catch (error) {
      throw LoginWithEmailPasswordException();
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (error) {
      //TODO
      //Same goes to here
    }
  }
}
