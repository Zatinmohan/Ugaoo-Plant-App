import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Auth/authController.dart';
import 'package:ugaoo/misc/colors.dart';

//Controls Login Form and contains Validator.

class LoginController extends GetxController {
  late GlobalKey<FormState> loginKey;
  late TextEditingController emailController, passController;

  var email = '';
  var pass = '';

  @override
  void onInit() {
    loginKey =  GlobalKey<FormState>();
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

  void checkLogin() async {
    final isValid = loginKey.currentState!.validate();

    if (isValid) {
      loginKey.currentState!.save();
      Get.snackbar(
        "Sign In",
        "Please wait while we are signing in",
        showProgressIndicator: true,
        margin: EdgeInsets.all(15),
        backgroundColor: kHeadingTextColor,
        progressIndicatorBackgroundColor: kBackgroundColor,
        colorText: ksecondaryBackgroundColor,
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.easeOutBack,
        isDismissible: false,
      );
      await AuthController.instance.signIn(email, pass);
    } else
      return;
  }
}
