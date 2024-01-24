import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ugaoo/utils/errors/login_exceptions/login_with_email_error.dart';
import 'package:ugaoo/utils/errors/login_exceptions/firebase_auth_errors.dart';
import 'package:ugaoo/utils/services/auth_service/repositories/auth_types_services.dart';

class AuthServiceWithFirebase implements AuthServicesRepo {
  FirebaseAuth _firebaseAuth;

  AuthServiceWithFirebase({required FirebaseAuth? auth})
      : _firebaseAuth = auth ?? FirebaseAuth.instance;

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
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions(e.toString());
    } catch (error) {
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
