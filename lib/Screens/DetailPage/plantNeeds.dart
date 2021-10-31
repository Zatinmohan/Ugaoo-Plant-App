import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class PlantNeeds extends StatelessWidget {
  final name, icon;
  const PlantNeeds({Key? key, this.name, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: width * 0.06,
          color: kDeailHeadingColor,
        ),
        SizedBox(width: 8.0),
        Text(
          "$name",
          style: TextStyle(
            color: kDeailHeadingColor,
            fontSize: width * 0.06,
          ),
        )
      ],
    );
  }
}
