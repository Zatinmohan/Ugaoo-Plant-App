import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/authController.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  late TextEditingController emailController, passController;

  var email = '';
  var pass = '';

  @override
  void onInit() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passController.dispose();
  // }

  String? validateEmail(String mail) {
    if (!GetUtils.isEmail(mail))
      return "Enter a valid email";
    else if (mail.isEmpty) return "* required";

    return null;
  }

  String? validatePassword(String pass) {
    if (pass.length < 6)
      return "Atleast 6 characters required";
    else if (pass.isEmpty) return "* required";

    return null;
  }

  void checkLogin() {
    final isValid = loginKey.currentState!.validate();

    if (isValid) {
      loginKey.currentState!.save();
      AuthController.instance.signIn(email, pass);
    } else
      return;
  }
}
