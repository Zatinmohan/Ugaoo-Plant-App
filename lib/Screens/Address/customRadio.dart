import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class CustomRadioWidget extends StatelessWidget {
  final value;
  const CustomRadioWidget({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _groupValue = "None";
    return Row(
      children: [
        Radio(
            value: "$value",
            groupValue: _groupValue,
            onChanged: (String? val) {
              _groupValue = val!;
            }),
        Text(
          "$value",
          style: TextStyle(
            color: kHeadingTextColor,
            fontSize: width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
