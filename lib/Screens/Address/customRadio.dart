import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class CustomRadioWidget extends StatefulWidget {
  final value;

  const CustomRadioWidget({Key? key, this.value}) : super(key: key);

  @override
  State<CustomRadioWidget> createState() => _CustomRadioWidgetState();
}

class _CustomRadioWidgetState extends State<CustomRadioWidget> {
  String _groupValue = "None";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            value: "${widget.value}",
            groupValue: _groupValue,
            onChanged: (String? val) {
              setState(() {
                _groupValue = "";
                _groupValue = val!;
              });
            }),
        Text(
          "${widget.value}",
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
