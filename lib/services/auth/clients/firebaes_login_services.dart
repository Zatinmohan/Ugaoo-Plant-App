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
  Future<bool> loginViaGoogle() async {
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
      log("Google Login Success", name: _logName);
      return await _preference?.setUserAfterLogin(user: userModel) ?? false;
    } on FirebaseAuthException catch (e) {
      log("", name: _logName, error: e);
      throw FirebaseAuthExceptions(e.toString());
    } catch (error) {
      log("", name: _logName, error: error);
      rethrow;
    }
  }

  @override
  Future<bool> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential _credentails =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final UserModel userModel = UserModel(
        firstName: _credentails.user?.displayName ?? "",
        lastName: "",
        loginType: _credentails.credential?.signInMethod,
        loginToken: _credentails.credential?.accessToken ?? "",
        isLoginSuccessful: true,
        userEmail: _credentails.user?.email ?? "",
        profileImage: _credentails.user?.photoURL ?? "",
      );

      return await _preference?.setUserAfterLogin(user: userModel) ?? false;
    } on FirebaseAuthException catch (error) {
      throw LoginWithEmailPasswordException.fromCode(code: error.code);
    } catch (error) {
      rethrow;
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
  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      return await _preference?.clearUserDataAfterLogout() ?? false;
    } catch (error) {
      throw error;
    }
  }
}
