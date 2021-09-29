import 'package:flutter/material.dart';
import 'package:ugaoo/Screens/Login/customDivider.dart';
import 'package:ugaoo/Screens/Login/googleLogin.dart';
import 'package:ugaoo/Screens/Login/heading.dart';
import 'package:ugaoo/Screens/Signup/signupForm.dart';
import 'package:ugaoo/misc/colors.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageHeading(heading: "Create Account"),
              SizedBox(height: width * 0.1),
              GoogleSignIn(),
              SizedBox(height: width * 0.1),
              CustomDivider(),
              SizedBox(height: width * 0.08),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
