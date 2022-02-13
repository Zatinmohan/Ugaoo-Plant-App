import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/UserController.dart';
import 'package:ugaoo/Database/database.dart';
import 'package:ugaoo/Model/userModel.dart';

class AuthController extends GetxController {
  //No need to find it again and again.
  //Once set, can be used in other clases just like that. No need to create object again and again.
  //SingleTon Class
  static AuthController instance = Get.find();

  //Creating Firebase Instance
  FirebaseAuth _auth = FirebaseAuth.instance;

  //Firabase User, that will change.
  late Rx<User?> _firebaseUser;

  @override
  void onInit() {
    Get.put<UserController>(UserController());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    _firebaseUser = Rx<User?>(_auth.currentUser); // Shows the current user.
    _firebaseUser.bindStream(
        _auth.userChanges()); // User would be notified, if there is a change

    //Provided by Getx
    //Listens everytime there is a change. Once set, it will run the function according to the change in variable.
    ever(_firebaseUser, _initialScreen); //Listner
  }

  _initialScreen(User? user) {
    if (user == null)
      Get.offAllNamed(
          '/Login'); //If user has logged out or app is installed for the first time, it will show the login screen.
    else
      Get.offAllNamed(
          '/Login/Main'); //If user signup, or logged in or already logged in, then it will directly takes you to the main page.
  }

  void signUp(String email, String password, String name, var phone) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() async {
        UserModel _userData = UserModel(
            id: _auth.currentUser?.uid, name: name, phone: phone, email: email);

        if (await Database().createNewUser(_userData)) {
          Get.find<UserController>().userData = _userData;
        }
      });
    } catch (e) {
      //Provided by Getx, No context needed.
      Get.snackbar("About User", "User Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Account Creation Failed"),
          messageText: Text(e.toString()));
    }
  }

  void signIn(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      Get.find<UserController>().userData =
          await Database().getUser(_auth.currentUser!.uid);
    } catch (e) {
      Get.snackbar("About Signin", "Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Sign in Failed"),
          messageText: Text(e.toString()));
    }
  }

  void logout() {
    try {
      _auth.signOut();
      Get.find<UserController>().clear();
      Get.offAndToNamed("/Login");
    } catch (e) {
      Get.snackbar("Error Logging out", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
