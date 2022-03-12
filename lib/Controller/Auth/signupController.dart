import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Auth/authController.dart';
import 'package:ugaoo/misc/colors.dart';

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
  void checkSignup() async {
    final isValid = signupForm.currentState!.validate();

    if (isValid) {
      signupForm.currentState!.save();
      Get.snackbar(
        "Creating Account",
        "Please wait while we are Creating your account",
        showProgressIndicator: true,
        margin: EdgeInsets.all(15),
        backgroundColor: kHeadingTextColor,
        progressIndicatorBackgroundColor: kBackgroundColor,
        colorText: ksecondaryBackgroundColor,
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.easeOutBack,
        isDismissible: false,
      );
      await AuthController.instance
          .signUp(email.text, password.text, fullName.text, phone.text);
    } else
      return;
  }
}
