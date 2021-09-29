import 'package:flutter/material.dart';
import 'package:ugaoo/Screens/Login/login.dart';
import 'package:ugaoo/Screens/MainPage/mainPage.dart';
import 'package:ugaoo/misc/colors.dart';

class CustomButton extends StatelessWidget {
  final String? name;
  final int? pageValue;
  final pageContext;
  final formKey;
  const CustomButton(
      {Key? key, this.name, this.pageValue, this.pageContext, this.formKey})
      : super(key: key);

  Page0() =>
      Navigator.push(pageContext, MaterialPageRoute(builder: (_) => Login()));

  Page1() {
    if (formKey.currentState?.validate() == true)
      Navigator.push(
          pageContext, MaterialPageRoute(builder: (_) => MainPage()));
  }

  Page2() {
    if (formKey.currentState?.validate() == true)
      Navigator.push(pageContext, MaterialPageRoute(builder: (_) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.07,
      child: ElevatedButton(
          onPressed: () {
            if (pageValue == 0)
              Page0();
            else if (pageValue == 1)
              Page1();
            else
              Page2();
          },
          style: ElevatedButton.styleFrom(
              primary: kBackgroundColor,
              elevation: 4,
              padding: EdgeInsets.all(5.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )),
          child: Text(
            "$name",
            style: TextStyle(
              color: ksecondaryBackgroundColor,
              fontWeight: FontWeight.w500,
              fontSize: width * 0.065,
            ),
          )),
    );
  }
}
