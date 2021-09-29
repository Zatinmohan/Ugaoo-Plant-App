import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ugaoo/Screens/Login/customDivider.dart';
import 'package:ugaoo/Screens/Login/googleLogin.dart';
import 'package:ugaoo/Screens/Login/userpass.dart';
import 'package:ugaoo/Screens/Signup/signup.dart';
import 'package:ugaoo/misc/colors.dart';

import 'heading.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                PageHeading(heading: "Welcome Back!"),
                SizedBox(height: width * 0.1),
                GoogleSignIn(),
                SizedBox(height: width * 0.1),
                CustomDivider(),
                SizedBox(height: width * 0.08),
                UsernamePassword(),
                SizedBox(height: width * 0.045),
                RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account yet? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "Click here",
                      style: TextStyle(
                          color: kBackgroundColor,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignupPage())),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
