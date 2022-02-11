import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.8,
      height: width * 0.12,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              )),
          onPressed: () => print("Logout"),
          child: Text("Logout")),
    );
  }
}
