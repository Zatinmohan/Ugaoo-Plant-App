import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            indent: width * 0.04,
            endIndent: width * 0.04,
            thickness: 1.0,
            color: Colors.grey,
          ),
        ),
        Text(
          "Or",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.045,
          ),
        ),
        Expanded(
          child: Divider(
            indent: width * 0.04,
            endIndent: width * 0.04,
            thickness: 1.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
