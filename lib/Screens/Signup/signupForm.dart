import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/signupController.dart';
import 'package:ugaoo/Screens/FirstPage/customButton.dart';
import 'package:ugaoo/misc/colors.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: Get.find<SignupController>().signupForm,
      child: Column(
        children: [
          TextFormField(
            controller: Get.find<SignupController>().fullName,
            validator: (val) => Get.find<SignupController>().checkName(val!),
            decoration: InputDecoration(
              border: textFieldBorder,
              focusedBorder: focusedBorder,
              hintText: "Name",
            ),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            controller: Get.find<SignupController>().email,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) =>
                Get.find<SignupController>().verifyEmail(value!),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: textFieldBorder,
              focusedBorder: focusedBorder,
              hintText: "Email",
            ),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            controller: Get.find<SignupController>().phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) => Get.find<SignupController>().verifyPhone(val!),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: textFieldBorder,
              focusedBorder: focusedBorder,
              hintText: "Phone number",
            ),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            controller: Get.find<SignupController>().password,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) =>
                Get.find<SignupController>().checkPassword(val!),
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
            formKey: Get.find<SignupController>().signupForm,
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
