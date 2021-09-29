import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.8,
      height: height * 0.07,
      child: ElevatedButton(
          onPressed: () => print("Sign In with google"),
          style: ElevatedButton.styleFrom(
            elevation: 4.0,
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/misc/gLogo.png",
                height: width * 0.06,
              ),
              SizedBox(width: 12.0),
              FittedBox(
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(
                    color: kHeadingTextColor,
                    fontSize: width * 0.055,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
