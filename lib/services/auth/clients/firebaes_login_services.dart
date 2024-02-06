import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ugaoo/errors/login_exceptions/login_with_email_error.dart';
import 'package:ugaoo/errors/login_exceptions/firebase_auth_errors.dart';
import 'package:ugaoo/services/auth/repositories/auth_types_services.dart';
import 'package:ugaoo/services/preferences/pref_keys.dart';
import 'package:ugaoo/services/preferences/repositories/preference_repository.dart';
import 'package:ugaoo/user/user_model.dart';

const String _logName = "Firebase Login Service";

class LoginServiceWithFirebase implements LoginServiceRepo {
  final FirebaseAuth _firebaseAuth;
  final PreferencesRepo? _preference;

  LoginServiceWithFirebase({
    required FirebaseAuth? auth,
    required PreferencesRepo? preference,
  })  : _firebaseAuth = auth ?? FirebaseAuth.instance,
        _preference = preference {
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
      final UserModel userModel = UserModel(
        firstName: googleUser?.displayName ?? "",
        lastName: "",
        loginType: credential.signInMethod,
        loginToken: credential.token.toString(),
        isLoginSuccessful: true,
        userEmail: googleUser?.email ?? "",
        profileImage: googleUser?.photoUrl ?? "",
      );
      await _preference?.setUserAfterLogin(user: userModel);
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

  Future<bool> isUserLoggedIn() async {
    return await _preference?.getBool(
          key: PreferenceKeys.ISLOGIN.name,
          defaultValue: false,
        ) ??
        false;
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      await _preference?.clearUserDataAfterLogout();
    } catch (error) {
      //TODO
      //Same goes to here
    }
  }
}
