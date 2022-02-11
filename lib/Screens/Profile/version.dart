import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class Version extends StatelessWidget {
  const Version({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "App version: 1.0",
        style: TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.w600,
          fontSize: width * 0.04,
        ),
      ),
    );
  }
}
