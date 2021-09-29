import 'package:flutter/material.dart';
import 'package:ugaoo/Screens/FirstPage/customButton.dart';
import 'package:ugaoo/misc/colors.dart';

class UsernamePassword extends StatefulWidget {
  UsernamePassword({Key? key}) : super(key: key);

  @override
  _UsernamePasswordState createState() => _UsernamePasswordState();
}

class _UsernamePasswordState extends State<UsernamePassword> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              validator: (value) {
                String pattern =
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?)*$";
                RegExp regex = new RegExp(pattern);
                if (value == null || value.isEmpty) return '* Required';
                if (!regex.hasMatch(value)) return "Enter a valid email";

                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: "Email",
                focusedBorder: focusedBorder,
                border: textFieldBorder,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              validator: (val) {
                if (val == null || val.isEmpty) return "* Required";
                return null;
              },
              decoration: InputDecoration(
                hintText: "Password",
                focusedBorder: focusedBorder,
                border: textFieldBorder,
              ),
            ),
            SizedBox(height: 15.0),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget your password?",
                style: TextStyle(
                  color: kHeadingTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.04,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: width * 0.08),
            // SizedBox(
            //   width: width * 0.8,
            //   height: height * 0.065,
            //   child: ElevatedButton(
            //       onPressed: () {
            //         _formKey.currentState?.validate();
            //       },
            //       style: ElevatedButton.styleFrom(
            //           primary: kBackgroundColor,
            //           elevation: 4,
            //           padding: EdgeInsets.all(5.0),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(30.0),
            //           )),
            //       child: Text(
            //         "SIGN IN",
            //         style: TextStyle(
            //           color: kHeadingTextColor,
            //           fontWeight: FontWeight.w500,
            //           fontSize: width * 0.065,
            //         ),
            //       )),
            // ),
            CustomButton(
                pageContext: context,
                pageValue: 1,
                formKey: _formKey,
                name: "SIGN IN"),
          ],
        ));
  }
}
