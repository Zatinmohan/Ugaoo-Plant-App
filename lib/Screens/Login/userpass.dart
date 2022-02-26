import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Auth/loginFormController.dart';
import 'package:ugaoo/Screens/FirstPage/customButton.dart';
import 'package:ugaoo/misc/colors.dart';

class UsernamePassword extends StatefulWidget {
  UsernamePassword({Key? key}) : super(key: key);

  @override
  _UsernamePasswordState createState() => _UsernamePasswordState();
}

class _UsernamePasswordState extends State<UsernamePassword> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: Get.find<LoginController>().loginKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              controller: Get.find<LoginController>().emailController,
              validator: (value) =>
                  Get.find<LoginController>().validateEmail(value!),
              onSaved: (value) {
                Get.find<LoginController>().email = value!;
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
              validator: (value) =>
                  Get.find<LoginController>().validatePassword(value!),
              onSaved: (value) {
                Get.find<LoginController>().pass = value!;
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
            CustomButton(
                pageContext: context,
                pageValue: 1,
                formKey: Get.find<LoginController>().loginKey,
                name: "SIGN IN"),
          ],
        ));
  }
}
