import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/authController.dart';

// Contains the Logic for Signup

class SignupController extends GetxController {
  late TextEditingController fullName, email, password, phone;
  final GlobalKey<FormState> signupForm =
      GlobalKey<FormState>(); //Form Key For Sign up form

  @override
  void onInit() {
    fullName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  //Validators
  String? verifyEmail(String email) {
    if (!GetUtils.isEmail(email))
      return "Enter a vaild Email";
    else if (email.isEmpty) return "* Require Email";
    return null;
  }

  String? verifyPhone(var phone) {
    if (phone == null || phone.isEmpty)
      return "* Required";
    else if (phone.length < 10) return "Invalid Phone number";
    return null;
  }

  String? checkPassword(String pass) {
    if (pass.length < 6)
      return "Atleast 6 character";
    else if (pass.isEmpty) return "* Required";
    return null;
  }

  String? checkName(String n) {
    if (n.isEmpty) return "* Required";
    return null;
  }

  //Form Check
  void checkSignup() {
    final isValid = signupForm.currentState!.validate();

    if (isValid) {
      signupForm.currentState!.save();
      AuthController.instance
          .signUp(email.text, password.text, fullName.text, phone.text);
    } else
      return;
  }
}
