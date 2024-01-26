import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ugaoo/utils/errors/login_exceptions/login_with_email_error.dart';
import 'package:ugaoo/utils/errors/login_exceptions/firebase_auth_errors.dart';
import 'package:ugaoo/utils/services/auth_service/repositories/auth_types_services.dart';

const String _logName = "Firebase Login Service";

class LoginServiceWithFirebase implements LoginServiceRepo {
  final FirebaseAuth _firebaseAuth;

  LoginServiceWithFirebase({required FirebaseAuth? auth})
      : _firebaseAuth = auth ?? FirebaseAuth.instance {
    log("Firebase Auth Service Started", name: _logName);
  }

  @override
  Future<void> loginViaGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      log("Google Login Success", name: _logName);
    } on FirebaseAuthException catch (e) {
      log("", name: _logName, error: e);
      throw FirebaseAuthExceptions(e.toString());
    } catch (error) {
      log("", name: _logName, error: error);
      throw const FirebaseAuthExceptions();
    }
  }

  @override
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential _credentails =
          await _firebaseAuth.signInWithEmailAndPassword(
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
      await _firebaseAuth.signOut();
    } catch (error) {
      //TODO
      //Same goes to here
    }
  }
}
