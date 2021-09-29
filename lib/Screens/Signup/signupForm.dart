import 'package:flutter/material.dart';
import 'package:ugaoo/Screens/FirstPage/customButton.dart';
import 'package:ugaoo/misc/colors.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (val) {
              if (val == null || val.isEmpty) return "* Required";
              return null;
            },
            decoration: InputDecoration(
              border: textFieldBorder,
              focusedBorder: focusedBorder,
              hintText: "Name",
            ),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: textFieldBorder,
              focusedBorder: focusedBorder,
              hintText: "Email",
            ),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) {
              if (val == null || val.isEmpty) return "*Required";
              if (val.length < 10) return "Invalid Phone Number";
              return null;
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: textFieldBorder,
              focusedBorder: focusedBorder,
              hintText: "Phone number",
            ),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) {
              if (val == null || val.isEmpty) return "* Required";
              if (val.length < 6)
                return "Atleast 6 characters";
              else
                null;
            },
            obscureText: true,
            decoration: InputDecoration(
              border: textFieldBorder,
              focusedBorder: focusedBorder,
              hintText: "Password",
            ),
          ),
          SizedBox(height: width * 0.08),
          CustomButton(
            name: "SIGN UP",
            pageContext: context,
            pageValue: 2,
            formKey: _formKey,
          ),
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
          //         "SIGN UP",
          //         style: TextStyle(
          //           color: kHeadingTextColor,
          //           fontWeight: FontWeight.w500,
          //           fontSize: width * 0.065,
          //         ),
          //       )),
          // ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
