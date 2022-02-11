import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges()); // User would be notified

    ever(_firebaseUser, _initialScreen); //Listner
  }

  _initialScreen(User? user) {
    if (user == null)
      Get.offAllNamed('/Login');
    else
      Get.offAllNamed('/Login/Main');
  }

  void signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Account Creation Failed"),
          messageText: Text(e.toString()));
    }
  }

  void signIn(String email, String pass) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) => print("$value"));
    } catch (e) {
      Get.snackbar("About Signin", "Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Sign in Failed"),
          messageText: Text(e.toString()));
    }
  }
}
